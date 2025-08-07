import 'package:fteam_challenge/app/domain/core/entities/base_entity.dart';

class InfoEntity extends BaseEntity {
  final int count;
  final int pages;
  final String? next;
  final String? prev;

  InfoEntity(
    super.id, {
    required this.count,
    required this.pages,
    this.next,
    this.prev,
  });
}
