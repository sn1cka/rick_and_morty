import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:rick_and_morty/data/models/character.dart';
import 'package:rick_and_morty/data/models/episode.dart';
import 'package:rick_and_morty/data/models/response_model.dart';

part 'network_source.g.dart';

@RestApi(baseUrl: 'https://rickandmortyapi.com/api')
@injectable
abstract class NetworkSource {
  @factoryMethod
  factory NetworkSource(Dio dio) = _NetworkSource;

  @GET('/character')
  Future<ResponseModel<CharacterModel>> getCharacters({
    @Query('page') int? page,
  });

  @GET('/episode')
  Future<ResponseModel<EpisodeModel>> getEpisodes({
    @Query('page') int? page,
  });
}
