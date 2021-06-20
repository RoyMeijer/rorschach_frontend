import 'package:equatable/equatable.dart';

class Question extends Equatable {
  final int questionNumber;
  final List<String> answers;
  final String imgPath;
  final String correctAnswer;


  Question({
    required this.correctAnswer,
    required this.questionNumber,
    required this.imgPath,
    required this.answers,
  });

  @override
  List<Object?> get props => [
    questionNumber,
    answers,
    imgPath
  ];

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      correctAnswer: map['correct_answer'],
      questionNumber: map['question_number'] ?? '',
      imgPath: map['img_path'] ?? '',
      answers: List<String>.from(map['answers'] ?? [])..shuffle()
    );
  }
}