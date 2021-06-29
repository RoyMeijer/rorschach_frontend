import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rorschach/controller/quiz/quiz.dart';
import 'package:rorschach/controller/quiz/quiz_state.dart';
import 'package:rorschach/models/failure.dart';
import 'package:rorschach/models/question.dart';
import 'package:rorschach/repositories/quiz/quiz.dart';
import 'package:rorschach/views/widgets/CustomButton.dart';
import 'package:rorschach/views/widgets/QuizError.dart';
import 'package:rorschach/views/widgets/QuizQuestions.dart';
import 'package:rorschach/views/widgets/QuizResults.dart';

final quizQuestionsProvider = FutureProvider.autoDispose<List<Question>>(
        (ref) => ref.watch(quizRepositoryProvider).getQuestions());

class QuizScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final quizQuestions = useProvider(quizQuestionsProvider);
    final pageController = usePageController();
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(top: 40.0),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFebd6a2), Color(0xFFf2d791)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: quizQuestions.when(
            data: (questions) => _buildBody(context, pageController, questions),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, _) => QuizError(
              message: error is Failure
                  ? error.message
                  : 'Something went wrong!',
              key: UniqueKey(),
            )),
        bottomSheet: quizQuestions.maybeWhen(
          data: (questions) {
            final QuizState quizState = useProvider(quizControllerProvider);
            if (!quizState.answered) return const SizedBox.shrink();
            return CustomButton(
              title: pageController.page!.toInt() + 1 < questions.length
                  ? 'Next Question'
                  : 'See Results',
              onTap: () {
                context
                    .read(quizControllerProvider.notifier)
                    .nextQuestion(questions, pageController.page!.toInt());
                if (pageController.page!.toInt() + 1 < questions.length) {
                  pageController.nextPage(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.linear,
                  );
                }
              },
              key: UniqueKey(),
            );
          },
          orElse: () => const SizedBox.shrink(),
        ),
      ),
    );
  }

  Widget _buildBody(
      BuildContext context,
      PageController pageController,
      List<Question> questions,
      ) {
    if (questions.isEmpty)
      return QuizError(
        message: 'No questions found.',
        key: UniqueKey(),
      );

    final quizState = useProvider(quizControllerProvider);
    return quizState.status == QuizStatus.complete
        ? QuizResults(
      state: quizState,
      questions: questions,
      key: UniqueKey(),
    )
        : QuizQuestions(
      pageController: pageController,
      state: quizState,
      questions: questions,
      key: UniqueKey(),
    );
  }
}