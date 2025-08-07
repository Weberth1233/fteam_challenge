import 'package:either_dart/either.dart';
import 'package:fteam_challenge/app/domain/entities/character_entity.dart';
import '../core/failures/failures.dart';
import '../repositories/ichacacter_repository.dart';

abstract class IUseCase {
  Future<Either<Failure, List<CharacterEntity>>> fetchResults(String path);
}

class UseCaseImpl implements IUseCase {
  final ICharacterRepository repository;

  UseCaseImpl({required this.repository});

  @override
  Future<Either<Failure, List<CharacterEntity>>> fetchResults(
    String path,
  ) async {
    final result = await repository.getResults(path);
    return result;
  }
}
