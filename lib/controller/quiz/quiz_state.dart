import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:rorschach/models/question.dart';

enum QuizStatus { initial, typical, atypical, complete }

class QuizState extends Equatable {
  final String selectedAnswer;
  final QuizStatus status;
  final List<Question> typical;
  final List<Question> atypical;

  QuizState(
      {required this.selectedAnswer,
      required this.status,
      required this.typical,
      required this.atypical});

  bool get answered =>
      status == QuizStatus.typical || status == QuizStatus.atypical;

  factory QuizState.initial() {
    return QuizState(
        selectedAnswer: '',
        typical: [],
        atypical: [],
        status: QuizStatus.initial);
  }

  @override
  List<Object?> get props => [selectedAnswer, typical, atypical, status];

  QuizState copyWith(
      {required String selectedAnswer,
      required List<Question> typical,
      required List<Question> atypical,
      required QuizStatus status}) {
    return QuizState(
        selectedAnswer: selectedAnswer,
        status: status,
        typical: typical,
        atypical: atypical);
  }

}
