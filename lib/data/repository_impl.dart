import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/core/mappers/mapper.dart';
import 'package:rick_and_morty/data/network_source.dart';
import 'package:rick_and_morty/domain/entities/character.dart';
import 'package:rick_and_morty/domain/entities/character_gender.dart';
import 'package:rick_and_morty/domain/entities/character_status.dart';
import 'package:rick_and_morty/domain/entities/episode.dart';
import 'package:rick_and_morty/domain/entities/response_info.dart';
import 'package:rick_and_morty/domain/repository.dart';

@Injectable(as: Repository, env: [Environment.prod])
class RepositoryImpl extends Repository {
  RepositoryImpl(this._client);

  final NetworkSource _client;
  final List<Character> bufferedCharacters = [];
  final List<Episode> bufferedEpisodes = [];

  int page = 0;

  @override
  Future<ResponseInfo<Character>> getCharacters(
      {String? name,
      CharacterStatus? status,
      CharacterGender? gender,
      String? species,
      String? type}) async {
    try {
      var result = await _client.getCharacters(page: page);
      bufferedCharacters.addAll(
          result.results.map((e) => Mapper.mapCharacterModelToEntity(e)));
      page++;
      return Mapper.mapInfoModelToEntitiy<Character>(
          result.info, bufferedCharacters);
    } on Exception catch (e) {
      rethrow;
    }
  }

  @override
  Future<ResponseInfo<Episode>> getEpisodes(
      {String? name, String? episode}) async {
    var result = await _client.getEpisodes();
    bufferedEpisodes
        .addAll(result.results.map((e) => Mapper.mapEpisodeModelToEntity(e)));
    return Mapper.mapInfoModelToEntitiy<Episode>(result.info, bufferedEpisodes);
  }
}
