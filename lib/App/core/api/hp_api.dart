import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/character_model.dart';

class HpApi {
  static const String _baseUrl = 'https://hp-api.onrender.com/api';
  static const String _charactersEndpoint = 'characters';

  /// Busca a lista completa de personagens da API HP.
  ///
  /// Retorna: Uma lista de CharacterModel.
  /// Lança: Exception em caso de falha de rede ou status de resposta inválido.
  Future<List<CharacterModel>> fetchAllCharacters() async {
    final uri = Uri.parse('$_baseUrl/$_charactersEndpoint');

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        // A API retorna uma lista de JSONs no corpo da resposta
        final List<dynamic> jsonList = jsonDecode(response.body);

        // Mapeia a lista de JSONs para a lista de CharacterModel.
        return jsonList.map((json) => CharacterModel.fromJson(json as Map<String, dynamic>)).toList();
      } else {
        // Tratamento de erros de status HTTP (404, 500, etc.)
        throw Exception('Falha ao carregar personagens. Status: ${response.statusCode}');
      }
    } catch (e) {
      // Tratamento de erros de rede (Timeouts, Sem Conexão, etc.)
      throw Exception('Erro de comunicação com a API: $e');
    }
  }
}