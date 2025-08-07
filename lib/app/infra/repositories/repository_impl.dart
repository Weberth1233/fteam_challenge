import 'package:either_dart/either.dart';
import '../../domain/core/entities/base_entity.dart';
import '../../domain/core/failures/failures.dart';
import '../../domain/entities/character_entity.dart';
import '../../domain/repositories/ichacacter_repository.dart';
import '../core/errors/exceptions.dart';
import '../datasources/data_sources_impl.dart';
import '../models/character_response_model.dart';

class RepositoryImpl<T extends BaseEntity> implements ICharacterRepository {
  final IDataSource dataSource;
  RepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, List<CharacterEntity>>> getResults(String path) async {
    try {
      final result = await dataSource.get<CharacterResponseModel>(
        (json) => CharacterResponseModel.fromJson(json),
        path,
      );
      final results = result.results.map((e) => e.toEntity()).toList();
      return Right(results);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on NotFoundException catch (e) {
      return Left(NotFoundFailure(e.message));
    } on UnknownException catch (e) {
      return Left(UnknownFailure(e.message));
    } on Exception catch (e) {
      return Left(UnknownFailure('Erro desconhecido: $e'));
    }
  }
}
