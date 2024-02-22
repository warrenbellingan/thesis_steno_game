class GameException implements Exception {
  final String message;
  GameException(this.message);

  @override
  String toString() {
    return message;
  }
}
