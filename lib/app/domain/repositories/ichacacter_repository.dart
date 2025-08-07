import 'package:either_dart/either.dart';
import 'package:fteam_challenge/app/domain/entities/character_entity.dart';

import '../core/failures/failures.dart';

abstract class ICharacterRepository {
  //Right retorna a entidade e left o erro
  Future<Either<Failure, List<CharacterEntity>>> getResults(String path);
}
