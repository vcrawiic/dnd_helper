import 'package:dnd_helper/pages/char_sheet/models/character_summary.dart';
import 'package:equatable/equatable.dart';

abstract class CharacterListState extends Equatable {
  const CharacterListState();

  @override
  List<Object?> get props => [];
}

class CharacterListInitial extends CharacterListState {}

class CharacterListLoading extends CharacterListState {}

class CharacterListLoaded extends CharacterListState {
  final List<CharacterSummary> characters;

  const CharacterListLoaded(this.characters);

  @override
  List<Object?> get props => [characters];
}

class CharacterListError extends CharacterListState {
  final String message;

  const CharacterListError(this.message);

  @override
  List<Object?> get props => [message];
}
