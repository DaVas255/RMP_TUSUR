import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idz/screens/result_screen.dart';
import '../cubit/quiz_cubit.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  String _selectedAnswer = '';
  bool _answered = false;

  void _submitAnswer(BuildContext context, String answer) {
    if (!_answered) {
      setState(() {
        _selectedAnswer = answer;
        _answered = true;
      });
      context.read<QuizCubit>().submitAnswer(answer);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Викторина'),
      ),
      body: BlocConsumer<QuizCubit, QuizState>(
        listener: (context, state) {
          if (state is QuizFinished) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const ResultScreen()),
            );
          }
        },
        builder: (context, state) {
          if (state is QuizLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is QuizLoaded || state is QuizAnswerResult) {
            final question = (state is QuizLoaded)
                ? state.question
                : (state as QuizAnswerResult).question;

            final totalQuestions = context.read<QuizCubit>().totalQuestions;
            final currentQuestionIndex =
                context.read<QuizCubit>().currentQuestionIndex + 1;

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Категория: ${question.category}',
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Вопрос $currentQuestionIndex из $totalQuestions',
                      style: const TextStyle(fontSize: 20.0),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      question.question,
                      style: const TextStyle(fontSize: 24.0),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: GridView.builder(
                        itemCount: question.allAnswers.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 2.5,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemBuilder: (context, index) {
                          final answer = question.allAnswers[index];
                          Color buttonColor = Colors.blue;
                          if (_answered) {
                            if (answer == question.correctAnswer) {
                              buttonColor = Colors.green;
                            } else if (answer == _selectedAnswer) {
                              buttonColor = Colors.red;
                            } else {
                              buttonColor = Colors.grey;
                            }
                          }
                          return ElevatedButton(
                            onPressed: () => _submitAnswer(context, answer),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: buttonColor,
                              textStyle: const TextStyle(fontSize: 16),
                              padding: const EdgeInsets.all(8.0),
                            ),
                            child: Text(
                              '${index + 1}. $answer',
                              textAlign: TextAlign.center,
                            ),
                          );
                        },
                      ),
                    ),
                    if (_answered)
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _answered = false;
                            _selectedAnswer = '';
                          });
                          context.read<QuizCubit>().nextQuestion();
                        },
                        child: const Text('Далее'),
                      ),
                  ],
                ),
              ),
            );
          } else if (state is QuizError) {
            return Center(child: Text(state.message));
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
