part of 'characters_cubit.dart';

final class CharactersInitial extends CharactersState {}

class CharactersLoaded extends CharactersState {
  final List<Character>? characters;
  CharactersLoaded({
    required this.characters,
  });
}

@immutable
sealed class CharactersState {}

class QouteLoaded extends CharactersState {
  final List<Quote>? qoutes;
  QouteLoaded({
    required this.qoutes,
  });
}
