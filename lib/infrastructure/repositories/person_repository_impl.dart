import 'package:cinemapedia/domain/datasources/person_datasource.dart';
import 'package:cinemapedia/domain/repositories/person_repository.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/person_details.dart';

class PersonRepositoryImpl extends PersonRepository {
  final PersonDatasource datasource;

  PersonRepositoryImpl(this.datasource);

  @override
  Future<Person> getPerson(String actorID) {
    return datasource.getPerson(actorID);
  }
}
