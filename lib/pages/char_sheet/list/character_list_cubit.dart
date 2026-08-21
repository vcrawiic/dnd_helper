import 'package:dnd_helper/pages/char_sheet/list/character_list_state.dart';
import 'package:dnd_helper/services/character/character_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharacterListCubit extends Cubit<CharacterListState> {
  final CharacterService _service;

  CharacterListCubit(this._service) : super(CharacterListInitial()) {
    load();
  }

  Future<void> load() async {
    try {
      if (!isClosed) emit(CharacterListLoading());
      final characters = await _service.getCharacters();
      if (!isClosed) emit(CharacterListLoaded(characters));
    } catch (e) {
      if (!isClosed) emit(CharacterListError(e.toString()));
    }
  }

  /// Создаёт персонажа и возвращает его id (для перехода на лист), либо null при ошибке.
  Future<int?> create() async {
    try {
      final id = await _service.createCharacter('New Character');
      await load();
      return id;
    } catch (e) {
      if (!isClosed) emit(CharacterListError(e.toString()));
      return null;
    }
  }

  Future<void> remove(int id) async {
    try {
      await _service.deleteCharacter(id);
      await load();
    } catch (e) {
      if (!isClosed) emit(CharacterListError(e.toString()));
    }
  }
}
