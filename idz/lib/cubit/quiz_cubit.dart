import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../models/question.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit() : super(QuizInitial());

  List<Question> _questions = [];
  int _currentQuestionIndex = 0;
  int _score = 0;
  DateTime? _startTime;
  DateTime? _endTime;

  int get currentQuestionIndex => _currentQuestionIndex;
  int get totalQuestions => _questions.length;

  Future<void> fetchQuestions(String difficulty) async {
    emit(QuizLoading());
    final url =
        'https://opentdb.com/api.php?amount=10&difficulty=$difficulty&type=multiple&encode=url3986';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      _questions = (data['results'] as List)
          .map((json) => Question.fromJson(json))
          .toList();
      _currentQuestionIndex = 0;
      _score = 0;
      _startTime = DateTime.now();
      emit(QuizLoaded(question: _questions[_currentQuestionIndex]));
    } else {
      emit(QuizError(message: 'Ошибка загрузки вопросов.'));
    }
  }

  void submitAnswer(String answer) {
    final currentQuestion = _questions[_currentQuestionIndex];
    bool isCorrect = answer == currentQuestion.correctAnswer;
    if (isCorrect) {
      _score++;
    }
    emit(QuizAnswerResult(
      isCorrect: isCorrect,
      question: currentQuestion,
    ));
  }

  void nextQuestion() {
    _currentQuestionIndex++;
    if (_currentQuestionIndex < _questions.length) {
      emit(QuizLoaded(question: _questions[_currentQuestionIndex]));
    } else {
      _endTime = DateTime.now();
      emit(QuizFinished(
        score: _score,
        total: _questions.length,
        timeSpent: _endTime!.difference(_startTime!),
      ));
    }
  }

  void restartQuiz() {
    _questions.clear();
    _currentQuestionIndex = 0;
    _score = 0;
    _startTime = null;
    _endTime = null;
    emit(QuizInitial());
  }
}
