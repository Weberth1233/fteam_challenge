class ServerException implements Exception {
  final String message;

  ServerException(this.message);

  @override
  String toString() => message;
}

class NetworkException implements Exception {}

class ParsingException implements Exception {
  final String message;

  ParsingException(this.message);
}

//NotFoundException
class NotFoundException implements Exception {
  final String message;

  NotFoundException(this.message);
}

class UnknownException implements Exception {
  final String message;

  UnknownException(this.message);
  // final String message = 'Erro desconhecido';
}

class InvalidUrlException implements Exception {
  final String message = 'URL inválida';
}
