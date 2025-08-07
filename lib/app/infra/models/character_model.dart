// data/models/character_model.dart

import '../../domain/entities/character_entity.dart';
import '../core/models/base_model.dart';

List<CharacterEntity> collectionCharacterFromJson(List<dynamic> jsonList) {
  return jsonList
      .map(
        (item) =>
            CharacterModel.fromJson(item as Map<String, dynamic>).toEntity(),
      )
      .toList();
}

class CharacterModel implements BaseModel<CharacterEntity> {
  final int id;
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

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      species: json['species'],
      type: json['type'],
      gender: json['gender'],
      originName: json['origin']['name'],
      originUrl: json['origin']['url'],
      locationName: json['location']['name'],
      locationUrl: json['location']['url'],
      image: json['image'],
      episodes: List<String>.from(json['episode']),
      url: json['url'],
      created: DateTime.parse(json['created']),
    );
  }

  CharacterModel({
    required this.id,
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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'status': status,
      'species': species,
      'type': type,
      'gender': gender,
      'origin': {'name': originName, 'url': originUrl},
      'location': {'name': locationName, 'url': locationUrl},
      'image': image,
      'episode': episodes,
      'url': url,
      'created': created.toIso8601String(),
    };
  }

  @override
  CharacterEntity toEntity() {
    return CharacterEntity(
      id,
      name: name,
      status: status,
      species: species,
      type: type,
      gender: gender,
      originName: originName,
      originUrl: originUrl,
      locationName: locationName,
      locationUrl: locationUrl,
      image: image,
      episodes: episodes,
      url: url,
      created: created,
    );
  }
}
