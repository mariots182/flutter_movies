import 'package:cinemapedia/infrastructure/models/moviedb/person_details.dart';

abstract class PersonRepository {
  Future<Person> getPerson(String actorID);
}
