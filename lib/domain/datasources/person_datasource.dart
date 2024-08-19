import 'package:cinemapedia/infrastructure/models/moviedb/person_details.dart';

abstract class PersonDatasource {
  Future<Person> getPerson(String actorID);
}
