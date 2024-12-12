import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/quiz_cubit.dart';
import '../screens/quiz_screen.dart';

class DifficultyScreen extends StatelessWidget {
  const DifficultyScreen({Key? key}) : super(key: key);

  void _startQuiz(BuildContext context, String difficulty) {
    context.read<QuizCubit>().fetchQuestions(difficulty);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const QuizScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () => _startQuiz(context, 'easy'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: const Color.fromARGB(255, 187, 16, 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(
                      color: Colors.cyan,
                      width: 2,
                    ),
                  ),
                ),
                child: const Text(
                  'Easy',
                  style: TextStyle(
                    fontSize: 30,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => _startQuiz(context, 'medium'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: const Color.fromARGB(255, 187, 16, 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(
                      color: Colors.cyan,
                      width: 2,
                    ),
                  ),
                ),
                child: const Text(
                  'Medium',
                  style: TextStyle(
                    fontSize: 30,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => _startQuiz(context, 'hard'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: const Color.fromARGB(255, 187, 16, 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(
                      color: Colors.cyan,
                      width: 2,
                    ),
                  ),
                ),
                child: const Text(
                  'Difficult',
                  style: TextStyle(
                    fontSize: 30,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
