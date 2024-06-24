import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/characters.dart';
import '../../data/models/quotes.dart';
import '../../data/repositories/characters_repo.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;
  List<Character>? characters;
  CharactersCubit(this.charactersRepository) : super(CharactersInitial());

  List<Character>? getAllCharacters() {
    charactersRepository.getAllCharacters().then((characters) {
      emit(CharactersLoaded(characters: characters));
      this.characters = characters;
    });

    return characters;
  }

  void getQoute() {
    charactersRepository.getQuote().then((qoute) {
      emit(QouteLoaded(qoutes: qoute));
    });
  }
}
