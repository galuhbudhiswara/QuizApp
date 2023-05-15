class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffledAnswer () {
      final shuflledList = List.of(answers);
      shuflledList.shuffle();
      return shuflledList;
  }
}