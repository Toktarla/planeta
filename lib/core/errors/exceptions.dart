class DatabaseInsertException implements Exception {
  final String message;
  DatabaseInsertException(this.message);
}

class DatabaseRemoveException implements Exception {
  final String message;
  DatabaseRemoveException(this.message);
}