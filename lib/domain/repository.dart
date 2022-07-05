import 'package:rick_and_morty/data/models/info.dart';
import 'package:rick_and_morty/domain/entities/character_gender.dart';
import 'package:rick_and_morty/domain/entities/character_status.dart';
import 'package:rick_and_morty/domain/entities/episode.dart';
import 'package:rick_and_morty/domain/entities/character.dart';
import 'package:rick_and_morty/domain/entities/response_info.dart';

abstract class Repository {
  Future<ResponseInfo<Episode>> getEpisodes({
    String? name,
    String? episode,
  });

  Future<ResponseInfo<Character>> getCharacters({
    String? name,
    CharacterStatus? status,
    CharacterGender? gender,
    String? species,
    String? type,
  });

}
