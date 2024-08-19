import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/datasources/person_datasource.dart';
import 'package:cinemapedia/infrastructure/mappers/person_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/person_details.dart';
import 'package:dio/dio.dart';

class MoviedbPersonDatasource extends PersonDatasource {
  final dio = Dio(BaseOptions(
      baseUrl: Environment.moviedbBase,
      queryParameters: {
        'api_key': Environment.moviedbKey,
        'language': Environment.moviedbLanguage
      }));

  @override
  Future<Person> getPerson(String actorID) async {
    final response = await dio.get('/person/$actorID');

    final creditsResponse = Person.fromJson(response.data);

    Person actor = PersonMapper.personToEntity(creditsResponse);

    return actor;
  }
}
