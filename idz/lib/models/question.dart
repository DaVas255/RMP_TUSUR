class Question {
  final String category; // Новое поле для категории
  final String question;
  final String correctAnswer;
  final List<String> allAnswers;

  Question({
    required this.category,
    required this.question,
    required this.correctAnswer,
    required this.allAnswers,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    String category =
        Uri.decodeComponent(json['category']); // Получаем категорию
    String question = Uri.decodeComponent(json['question']);
    String correctAnswer = Uri.decodeComponent(json['correct_answer']);
    List<String> incorrectAnswers = (json['incorrect_answers'] as List)
        .map((e) => Uri.decodeComponent(e))
        .toList();

    List<String> allAnswers = [...incorrectAnswers, correctAnswer];
    allAnswers.shuffle();

    return Question(
      category: category,
      question: question,
      correctAnswer: correctAnswer,
      allAnswers: allAnswers,
    );
  }
}
