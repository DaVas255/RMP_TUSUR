import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/quiz_cubit.dart';
import '../screens/difficulty_screen.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);

  void _restartQuiz(BuildContext context) {
    context.read<QuizCubit>().restartQuiz();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const DifficultyScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Результаты'),
      ),
      body: BlocBuilder<QuizCubit, QuizState>(
        builder: (context, state) {
          if (state is QuizFinished) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0), // Добавил отступы
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Ваш счет: ${state.score} из ${state.total}',
                      style: const TextStyle(fontSize: 24.0),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Время: ${state.timeSpent.inSeconds} секунд',
                      style: const TextStyle(fontSize: 20.0),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () => _restartQuiz(context),
                      child: const Text('Начать заново'),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
