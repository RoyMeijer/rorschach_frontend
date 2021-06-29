import 'package:equatable/equatable.dart';

class Answer extends Equatable {
  final String answerText;
  final bool neurotypical;

  Answer({
    required this.answerText,
    required this.neurotypical
  });

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

  factory Answer.fromMap(Map<String, dynamic> map) {
    return Answer(
      answerText: map['answer_text'],
      neurotypical: map['neurotypical'],
    );
  }
}