import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieInfoProvider =
    StateNotifierProvider<MovieMapNotifier, Map<String, Movie>>((ref) {
  final getMovie = ref.watch(movieRepositoryProvider);
  return MovieMapNotifier(getMovie: getMovie.getMovieById);
});

/*

Se maneja un objeto Map
con el id de la pelicula y se localiza la pelicula que tiene asignada

{
  '12345567': Movie,
  '12345599': Movie,
  '12345423': Movie,
  '16534567': Movie,
  '12345532': Movie,
  '12384753': Movie,
}



*/

typedef GetMoviewCallback = Future<Movie> Function(String movieId);

class MovieMapNotifier extends StateNotifier<Map<String, Movie>> {
  GetMoviewCallback getMovie;

  MovieMapNotifier({required this.getMovie}) : super({});

  Future<void> loadMovie(String movieId) async {
    if (state[movieId] != null) return;

    final movie = await getMovie(movieId);

    state = {...state, movieId: movie};
  }
}
