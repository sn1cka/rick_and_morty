import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/domain/entities/character.dart';
import 'package:rick_and_morty/domain/repository.dart';

part 'characters_state.dart';

@Injectable()
class CharactersCubit extends Cubit<CharactersState> {
  CharactersCubit(this._repository) : super(CharactersInitial());

  final Repository _repository;

  void getCharacters() async {
    emit(CharactersLoading());
    await _repository.getCharacters().then(
          (value) => emit(
            CharactersUpdated(value.endReached, value.results),
          ),
        );
  }
}
