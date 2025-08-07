// domain/entities/character_entity.dart

import 'package:fteam_challenge/app/domain/core/entities/base_entity.dart';

class CharacterEntity extends BaseEntity {
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final String originName;
  final String originUrl;
  final String locationName;
  final String locationUrl;
  final String image;
  final List<String> episodes;
  final String url;
  final DateTime created;

  CharacterEntity(
    super.id, {
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.originName,
    required this.originUrl,
    required this.locationName,
    required this.locationUrl,
    required this.image,
    required this.episodes,
    required this.url,
    required this.created,
  });
}
