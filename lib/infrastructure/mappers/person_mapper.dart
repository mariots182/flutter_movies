import 'package:cinemapedia/infrastructure/models/moviedb/person_details.dart';

class PersonMapper {
  static Person personToEntity(Person person) => Person(
        adult: person.adult,
        alsoKnownAs: person.alsoKnownAs,
        biography: person.biography,
        birthday: person.birthday,
        deathday: person.deathday,
        gender: person.gender,
        homepage: person.homepage,
        id: person.id,
        imdbId: person.imdbId,
        knownForDepartment: person.knownForDepartment,
        name: person.name,
        placeOfBirth: person.placeOfBirth,
        popularity: person.popularity,
        profilePath: person.profilePath != null
            ? 'https://image.tmdb.org/t/p/w500${person.profilePath}'
            : 'https://resizing.flixster.com/m1Q0L4ro8-KI3svEkjRToiHK5mM=/ems.cHJkLWVtcy1hc3NldHMvbW92aWVzL2NjMWQxZTFiLWIzMjEtNGIwMS1hNTgwLWQ4ZDU0NTBmNTBhYi53ZWJw',
      );
}
