import '../models/characters.dart';
import '../models/quotes.dart';
import '../web_services/characters_web_services.dart';

class CharactersRepository {
  final CharactersWebServices charactersWebServices;
  CharactersRepository({
    required this.charactersWebServices,
  });

  Future<List<Character>> getAllCharacters() async {
    final character = await charactersWebServices.getAllCharacters();
    final characters = (character['results'] as List)
        .map((characterData) => Character.fromJson(characterData))
        .toList();
    return characters;
  }

  Future<List<Quote>> getQuote() async {
    final qoutes = await charactersWebServices.getQuote();

    final qoute = (qoutes).map((char) => Quote.fromJson(char)).toList();
    return qoute;
  }
}
