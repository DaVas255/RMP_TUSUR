part of 'quiz_cubit.dart';

@immutable
abstract class QuizState {}

class QuizInitial extends QuizState {}

class QuizLoading extends QuizState {}

class QuizLoaded extends QuizState {
  final Question question;

  QuizLoaded({required this.question});
}

class QuizAnswerResult extends QuizState {
  final bool isCorrect;
  final Question question;

  QuizAnswerResult({
    required this.isCorrect,
    required this.question,
  });
}

class QuizFinished extends QuizState {
  final int score;
  final int total;
  final Duration timeSpent;

  QuizFinished({
    required this.score,
    required this.total,
    required this.timeSpent,
  });
}

class QuizError extends QuizState {
  final String message;

  QuizError({required this.message});
}
