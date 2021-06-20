import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rorschach/models/failure.dart';
import 'package:rorschach/models/question.dart';
import 'package:rorschach/repositories/quiz/base_quiz.dart';

final dioProvider = Provider<Dio>((ref) => Dio());

final quizRepositoryProvider = Provider<QuizRepository>((ref) => QuizRepository(ref.read));

class QuizRepository extends BaseQuizRepository {
  final Reader _read;

  QuizRepository(this._read);

  @override
  Future<List<Question>> getQuestions() async {
    try {
      final response =
          await _read(dioProvider).get('http://localhost:8080/api/question');
      if (response.statusCode == 200) {
        final data = Map<String, dynamic>.from(response.data);
        final results = List<Map<String,dynamic>>.from(data['results'] ?? []);
        if (results.isNotEmpty) {
          return results.map((e) => Question.fromMap(e)).toList();
        }
      }
    } on DioError catch (err) {
      print(err);
      throw Failure(message:err.response!.statusMessage ?? '');
    } on SocketException catch (err) {
      print(err);
      throw const Failure(message: 'Please check your connection.');
    }

    catch (err) {
    }
      return [];
  }
}
