import 'package:equatable/equatable.dart';
import 'package:rorschach/models/answer.dart';

class Question extends Equatable {
  final int questionNumber;
  final List<Answer> answers;
  final String imgPath;
  final String correctAnswer;

  Question({
    required this.correctAnswer,
    required this.questionNumber,
    required this.imgPath,
    required this.answers,
  });

  @override
  List<Object?> get props => [questionNumber, answers, imgPath];

  factory Question.fromMap(Map<String, dynamic> map) {
    List<Answer> answerList = [];
    map['answers'].map((e) => answerList.add(Answer.fromMap(e))).toList();
    return Question(
        correctAnswer: map['correct_answer'],
        questionNumber: map['question_number'] ?? '',
        imgPath: map['img_path'] ?? '',
        answers: answerList);
  }
}
