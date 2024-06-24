import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CharactersWebServices {
  final dio = Dio();
  Future<Map<String, dynamic>> getAllCharacters() async {
    try {
      final response = await dio.get(
        'https://rickandmortyapi.com/api/character',
        options: Options(
          receiveDataWhenStatusError: true,
        ),
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        debugPrint('Error: ${response.statusMessage}');
        return {};
      }
    } catch (e) {
      debugPrint('Error: $e');
      return {};
    }
  }

  Future<List> getQuote() async {
    try {
      final headers = {'X-Api-Key': 'YOUR_API_KEY_HERE'};
      final response = await dio.get(
        'https://api.api-ninjas.com/v1/quotes',
        options: Options(
          headers: headers,
          receiveDataWhenStatusError: true,
        ),
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        return [];
      }
    } catch (e) {
      debugPrint('Error: $e');
      return [];
    }
  }
}
