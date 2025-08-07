import 'package:fteam_challenge/app/domain/core/entities/base_entity.dart';

abstract class BaseModel<T extends BaseEntity> {
  T toEntity();
}
