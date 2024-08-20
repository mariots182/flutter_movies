import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/movie_details.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/movie_moviedb.dart';

class MovieMapper {
  static Movie movieDBToEntity(MovieMovieDB moviedb) => Movie(
      adult: moviedb.adult,
      backdropPath: moviedb.backdropPath != ''
          ? 'https://image.tmdb.org/t/p/w500${moviedb.backdropPath}'
          : 'https://resizing.flixster.com/m1Q0L4ro8-KI3svEkjRToiHK5mM=/ems.cHJkLWVtcy1hc3NldHMvbW92aWVzL2NjMWQxZTFiLWIzMjEtNGIwMS1hNTgwLWQ4ZDU0NTBmNTBhYi53ZWJw',
      genreIds: moviedb.genreIds.map((e) => e.toString()).toList(),
      id: moviedb.id,
      originalLanguage: moviedb.originalLanguage,
      originalTitle: moviedb.originalTitle,
      overview: moviedb.overview,
      popularity: moviedb.popularity,
      posterPath: moviedb.posterPath != ''
          ? 'https://image.tmdb.org/t/p/w500${moviedb.posterPath}'
          : 'https://resizing.flixster.com/m1Q0L4ro8-KI3svEkjRToiHK5mM=/ems.cHJkLWVtcy1hc3NldHMvbW92aWVzL2NjMWQxZTFiLWIzMjEtNGIwMS1hNTgwLWQ4ZDU0NTBmNTBhYi53ZWJw',
      releaseDate: moviedb.releaseDate ?? DateTime.now(),
      title: moviedb.title,
      video: moviedb.video,
      voteAverage: moviedb.voteAverage,
      voteCount: moviedb.voteCount);

  static Movie movieDetailsToEntity(MovieDetails moviedb) => Movie(
      adult: moviedb.adult,
      backdropPath: moviedb.backdropPath != ''
          ? 'https://image.tmdb.org/t/p/w500${moviedb.backdropPath}'
          : 'https://resizing.flixster.com/m1Q0L4ro8-KI3svEkjRToiHK5mM=/ems.cHJkLWVtcy1hc3NldHMvbW92aWVzL2NjMWQxZTFiLWIzMjEtNGIwMS1hNTgwLWQ4ZDU0NTBmNTBhYi53ZWJw',
      genreIds: moviedb.genres.map((e) => e.name).toList(),
      id: moviedb.id,
      originalLanguage: moviedb.originalLanguage,
      originalTitle: moviedb.originalTitle,
      overview: moviedb.overview,
      popularity: moviedb.popularity,
      posterPath: moviedb.posterPath != ''
          ? 'https://image.tmdb.org/t/p/w500${moviedb.posterPath}'
          : 'https://resizing.flixster.com/m1Q0L4ro8-KI3svEkjRToiHK5mM=/ems.cHJkLWVtcy1hc3NldHMvbW92aWVzL2NjMWQxZTFiLWIzMjEtNGIwMS1hNTgwLWQ4ZDU0NTBmNTBhYi53ZWJw',
      releaseDate: moviedb.releaseDate,
      title: moviedb.title,
      video: moviedb.video,
      voteAverage: moviedb.voteAverage,
      voteCount: moviedb.voteCount);
}
