import 'character_model.dart';
import 'info_model.dart';

class ApiResponse {}

class CharacterResponseModel extends ApiResponse {
  final InfoModel info;
  final List<CharacterModel> results;

  CharacterResponseModel({required this.info, required this.results});

  factory CharacterResponseModel.fromJson(Map<String, dynamic> json) {
    return CharacterResponseModel(
      info: InfoModel.fromJson(json['info']),
      results: (json['results'] as List)
          .map((item) => CharacterModel.fromJson(item))
          .toList(),
    );
  }
}
