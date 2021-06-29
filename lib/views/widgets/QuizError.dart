import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rorschach/views/screens/QuizScreen.dart';
import 'package:rorschach/views/widgets/CustomButton.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class QuizError extends StatelessWidget {
  final String message;

  const QuizError({
    required Key key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              message,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
            const SizedBox(height: 20.0),
            CustomButton(
              key: UniqueKey(),
              title: 'Retry',
              onTap: () => context.refresh(quizQuestionsProvider),
            )
          ],
        ));
  }
}