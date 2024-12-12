import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/quiz_cubit.dart';
import 'screens/difficulty_screen.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => QuizCubit()),
      ],
      child: MaterialApp(
        title: 'Викторина',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const DifficultyScreen(),
      ),
    );
  }
}
