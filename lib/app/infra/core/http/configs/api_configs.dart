// lib/infra/core/http/api_config.dart

class ApiConfig {
  static const String baseUrl = 'https://rickandmortyapi.com/api';

  static Map<String, String> get defaultHeaders => {
    'Accept': 'application/json',
  };
}
