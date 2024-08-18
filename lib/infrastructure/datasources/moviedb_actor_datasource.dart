import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/datasources/actors_datasource.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infrastructure/mappers/actor_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/credits_response.dart';
import 'package:dio/dio.dart';

class MoviedbActorDatasource extends ActorsDatasource {
  final dio = Dio(BaseOptions(
      baseUrl: Environment.moviedbBase,
      queryParameters: {
        'api_key': Environment.moviedbKey,
        'language': Environment.moviedbLanguage
      }));

  @override
  Future<List<Actor>> getActorsByMovie(String movieID) async {
    final response = await dio.get('/movie/$movieID/credits');

    final creditsResponse = CreditsResponse.fromJson(response.data);

    List<Actor> actors = creditsResponse.cast
        .map((cast) => ActorMapper.castToEntity(cast))
        .toList();

    return actors;
  }
}
