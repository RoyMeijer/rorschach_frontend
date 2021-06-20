import 'package:rorschach/models/question.dart';

abstract class BaseQuizRepository {

  Future<List<Question>> getQuestions();
}