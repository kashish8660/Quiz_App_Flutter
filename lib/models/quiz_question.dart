class QuizQuestion { //works like model or data class
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffledList() {
    final shuffledList = List.of(answers); //'of()' is used to create copy of some list
    shuffledList.shuffle();
    return shuffledList;
  }
}