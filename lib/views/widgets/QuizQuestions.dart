import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:html_character_entities/html_character_entities.dart';
import 'package:rorschach/controller/quiz/quiz.dart';
import 'package:rorschach/controller/quiz/quiz_state.dart';
import 'package:rorschach/models/question.dart';
import 'package:rorschach/views/widgets/AnswerCard.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class QuizQuestions extends StatelessWidget {
  final PageController pageController;
  final QuizState state;
  final List<Question> questions;

  const QuizQuestions({
    required Key key,
    required this.pageController,
    required this.state,
    required this.questions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      physics: NeverScrollableScrollPhysics(),
      itemCount: questions.length,
      itemBuilder: (BuildContext context, int index) {
        final question = questions[index];
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 12.0),
              child: Text(
                HtmlCharacterEntities.decode("what do you see?"),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Card(
              elevation: 20.0,
              margin: EdgeInsets.all(10.0),
              child: Image.asset('assets/images/rorschach-blot-1.jpg'),
            ),
            Expanded(
                child: ListView(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(8.0),
                    children: [
                  Column(
                    children: question.answers
                        .map(
                          (e) => AnswerCard(
                            answer: e.answerText,
                            isSelected: e.answerText == state.selectedAnswer,
                            isCorrect: e.answerText == question.correctAnswer,
                            isDisplayingAnswer: state.answered,
                            onTap: () => context.read(quizControllerProvider.notifier)
                                .submitAnswer(question, e.answerText),
                            key: UniqueKey(),
                          ),
                        )
                        .toList(),
                  ),
                ]))
          ],
        );
      },
    );
  }
}
