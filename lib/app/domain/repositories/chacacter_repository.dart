import 'package:either_dart/either.dart';
import 'package:fteam_challenge/app/domain/entities/character_entity.dart';

import '../core/failures/server_failures.dart';

abstract class CharacterRepository {
  //Right retorna a entidade e left o erro
  Future<Either<ServerFailures, CharacterEntity>> getCharacters();
}
