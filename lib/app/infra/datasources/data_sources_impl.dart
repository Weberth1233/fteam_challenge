import 'dart:convert';

import 'package:fteam_challenge/app/infra/core/errors/exceptions.dart';
import 'package:fteam_challenge/app/infra/core/http/configs/api_configs.dart';

import '../models/character_response_model.dart';
import 'package:http/http.dart' as http;

abstract class IDataSource {
  Future<CharacterResponseModel> get(
    CharacterResponseModel Function(Map<String, dynamic> json) fromJson,
    String path,
  );
}

class DataSourcesImpl implements IDataSource {
  final http.Client client;

  DataSourcesImpl({required this.client});

  @override
  Future<CharacterResponseModel> get(
    CharacterResponseModel Function(Map<String, dynamic> json) fromJson,
    String path,
  ) async {
    try {
      final url = '${ApiConfig.baseUrl}/$path';
      final response = await client.get(
        Uri.parse(url),
        headers: ApiConfig.defaultHeaders,
      );
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
        return fromJson(jsonResponse);
      } else if (response.statusCode == 404) {
        throw NotFoundException('Recurso não encontrado: ${response.body}');
      } else if (response.statusCode == 500) {
        throw ServerException('Erro no servidor: ${response.body}');
      } else {
        throw UnknownException('Erro desconhecido: ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }
}
