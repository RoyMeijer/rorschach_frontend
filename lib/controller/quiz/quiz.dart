import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rorschach/controller/quiz/quiz_state.dart';
import 'package:rorschach/models/question.dart';

final quizControllerProvider =
    StateNotifierProvider.autoDispose<QuizController, QuizState>(
  (ref) => QuizController(),
);

class QuizController extends StateNotifier<QuizState> {
  QuizController() : super(QuizState.initial());

  void submitAnswer(Question currentQuestion, String answer) {
    if (state.answered) return;
    if (currentQuestion.correctAnswer == answer) {
      state = state.copyWith(
        selectedAnswer: answer,
        typical: state.typical..add(currentQuestion),
        atypical: state.atypical,
        status: QuizStatus.typical,
      );
    } else {
      state = state.copyWith(
        selectedAnswer: answer,
        typical: state.atypical..add(currentQuestion),
        atypical: state.typical,
        status: QuizStatus.atypical,
      );
    }
  }

  void nextQuestion(List<Question> question, int currentIndex) {
    state = state.copyWith(
      selectedAnswer: '',
      typical: state.typical,
      atypical: state.atypical,
      status: currentIndex + 1 < question.length
          ? QuizStatus.initial
          : QuizStatus.complete,
    );
  }

  void reset() {
    state = QuizState.initial();
  }
}
