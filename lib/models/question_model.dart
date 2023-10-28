class QuestionModel {
  const QuestionModel(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> get shuffledAnswers {
    final shuffleList = List.of(answers);
    shuffleList.shuffle();
    return shuffleList;
  }
}
