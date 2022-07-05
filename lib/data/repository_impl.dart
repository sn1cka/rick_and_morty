import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/core/locator/get_it.dart';
import 'package:rick_and_morty/data/models/character.dart';
import 'package:rick_and_morty/data/models/episode.dart';
import 'package:rick_and_morty/data/models/info.dart';
import 'package:rick_and_morty/data/models/location.dart';
import 'package:rick_and_morty/data/network_source.dart';
import 'package:rick_and_morty/domain/entities/character.dart';
import 'package:rick_and_morty/domain/entities/character_gender.dart';
import 'package:rick_and_morty/domain/entities/character_status.dart';
import 'package:rick_and_morty/domain/entities/episode.dart';
import 'package:rick_and_morty/domain/entities/location.dart';
import 'package:rick_and_morty/domain/entities/response_info.dart';
import 'package:rick_and_morty/domain/repository.dart';

@Injectable(as: Repository, env: [Environment.prod])
class RepositoryImpl extends Repository {
  RepositoryImpl(this._client);

  final NetworkSource _client;

  Location _mapLocationModelToEntity(LocationModel model) {
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

  Character _mapCharacterModelToEntity(CharacterModel model) {
    return Character(
      id: model.id,
      name: model.name,
      status: model.status,
      species: model.species,
      type: model.type,
      gender: model.gender,
      origin: _mapLocationModelToEntity(model.origin),
      location: _mapLocationModelToEntity(model.location),
      image: model.image,
      episode: model.episode,
      url: model.url,
      created: model.created,
    );
  }

  Episode _mapEpisodeModelToEntity(EpisodeModel model) {
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

  ResponseInfo<T> _mapInfoModelToEntitiy<T>(InfoModel model, List<T> results) {
    return ResponseInfo<T>(
      endReached: model.next == null,
      exception: null,
      results: results,
    );
  }

  @override
  Future<ResponseInfo<Character>> getCharacters(
      {String? name,
      CharacterStatus? status,
      CharacterGender? gender,
      String? species,
      String? type}) async {
    var result = await _client.getCharacters();
    return _mapInfoModelToEntitiy<Character>(result.info,
        result.results.map((e) => _mapCharacterModelToEntity(e)).toList());
  }

  @override
  Future<ResponseInfo<Episode>> getEpisodes(
      {String? name, String? episode}) async {
    var result = await _client.getEpisodes();
    return _mapInfoModelToEntitiy<Episode>(result.info,
        result.results.map((e) => _mapEpisodeModelToEntity(e)).toList());

  }
}
