class QuizModel {
  final String question;
  final List<String> answers;
  final int correctAnswerIndex;

  QuizModel(this.question, this.answers, this.correctAnswerIndex);
}

final List<QuizModel> quizList = [
  QuizModel("What is the capital of Egypt?",
      ["Luxor", "Alexandria", "Giza", "Cairo"], 3),
  QuizModel(
      "what is your job as engineer",
      [
        "flutter developer",
        "doctor",
        "teacher",
        "officer",
      ],
      0),
  QuizModel(
      "What is the capital of France",
      [
        "Berlin",
        "Paris",
        "London",
        "Rome",
      ],
      1),
  QuizModel(
      "Who wrote the play \"Romeo and Juliet\"",
      [
        "William Shakespeare",
        "Khaled Tawfik",
        "Charles",
        "Taha Hussein",
      ],
      0),
  QuizModel(
      "How many planets are in the solar system?", ["7", "8", "9", "10"], 1),
];
