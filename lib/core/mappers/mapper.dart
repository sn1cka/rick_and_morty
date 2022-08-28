import 'package:rick_and_morty/data/models/character.dart';
import 'package:rick_and_morty/data/models/episode.dart';
import 'package:rick_and_morty/data/models/info.dart';
import 'package:rick_and_morty/data/models/location.dart';
import 'package:rick_and_morty/domain/entities/character.dart';
import 'package:rick_and_morty/domain/entities/episode.dart';
import 'package:rick_and_morty/domain/entities/location.dart';
import 'package:rick_and_morty/domain/entities/response_info.dart';

abstract class Mapper {
  static Location mapLocationModelToEntity(LocationModel model) {
    return Location(
      id: model.id,
      name: model.name,
      type: model.type,
      dimension: model.dimension,
      residents: model.residents,
      url: model.url,
      created: model.created,
    );
  }

  static Character mapCharacterModelToEntity(CharacterModel model) {
    return Character(
      id: model.id,
      name: model.name,
      status: model.status,
      species: model.species,
      type: model.type,
      gender: model.gender,
      origin: mapLocationModelToEntity(model.origin),
      location: mapLocationModelToEntity(model.location),
      image: model.image,
      episode: model.episode,
      url: model.url,
      created: model.created,
    );
  }

  static Episode mapEpisodeModelToEntity(EpisodeModel model) {
    return Episode(
      id: model.id,
      characters: model.characters,
      airDate: model.airDate,
      url: model.url,
      created: model.created,
      episode: model.episode,
      name: model.name,
    );
  }

  static ResponseInfo<T> mapInfoModelToEntitiy<T>(
      InfoModel model, List<T> results) {
    return ResponseInfo<T>(
      endReached: model.next == null,
      exception: null,
      results: results,
    );
  }
}
