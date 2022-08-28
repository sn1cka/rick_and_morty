part of 'characters_cubit.dart';

abstract class CharactersState extends Equatable {
  const CharactersState();
}

class CharactersInitial extends CharactersState {
  @override
  List<Object> get props => [];
}

class CharactersLoading extends CharactersState {
  @override
  List<Object> get props => [];
}

class CharactersException extends CharactersState {
  const CharactersException(this.exception);

  final Exception exception;

  @override
  List<Object> get props => [exception];
}

class CharactersUpdated extends CharactersState {
  const CharactersUpdated(this.isLastPortion, this.characters);

  final bool isLastPortion;
  final List<Character> characters;

  @override
  List<Object> get props => [isLastPortion, characters];
}
