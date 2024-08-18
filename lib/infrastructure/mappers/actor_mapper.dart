import 'package:cinemapedia/infrastructure/models/moviedb/credits_response.dart';
import '../../domain/entities/actor.dart';

class ActorMapper {
  static Actor castToEntity(Cast cast) => Actor(
      id: cast.id,
      name: cast.name,
      profilePath: cast.profilePath != null
          ? 'https://image.tmdb.org/t/p/w500${cast.profilePath}'
          : 'https://resizing.flixster.com/m1Q0L4ro8-KI3svEkjRToiHK5mM=/ems.cHJkLWVtcy1hc3NldHMvbW92aWVzL2NjMWQxZTFiLWIzMjEtNGIwMS1hNTgwLWQ4ZDU0NTBmNTBhYi53ZWJw',
      character: cast.character);
}
