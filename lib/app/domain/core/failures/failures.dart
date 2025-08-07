//Apenas classes desse arquivo conseguem estender Failure(sealed)
sealed class Failure {
  final String message;

  const Failure(this.message);
}

class NetworkFailure extends Failure {
  const NetworkFailure({String message = "Erro de conexão"}) : super(message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);
}

class InvalidParamsFailure extends Failure {
  const InvalidParamsFailure({String message = "Parâmetros inválidos"})
    : super(message);
}

class ParsingFailure extends Failure {
  const ParsingFailure({String message = "Erro ao decodificar"})
    : super(message);
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure({String message = "Usuário não autorizado"})
    : super(message);
}

class UnknownFailure extends Failure {
  UnknownFailure(super.message);
}

/// NotFoundFailure
class NotFoundFailure extends Failure {
  NotFoundFailure(super.message);
}
