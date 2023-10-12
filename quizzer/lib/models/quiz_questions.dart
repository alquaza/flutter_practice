class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    // can do final because final just means it cannot be reassigned, does not mean it cannot be changed
    final shuffledList = List.of(answers);
    shuffledList.shuffle();

    return shuffledList;
  }
}
