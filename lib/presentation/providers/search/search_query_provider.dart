import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');

final searchedMoviesProvider =
    StateNotifierProvider<SearchedMovieNotifier, List<Movie>>((ref) {
  final movieRepository = ref.read(movieRepositoryProvider);

  return SearchedMovieNotifier(
      searchMovies: movieRepository.searchMovies, ref: ref);
});

typedef SearchMovieCallback = Future<List<Movie>> Function(String query);

class SearchedMovieNotifier extends StateNotifier<List<Movie>> {
  final SearchMovieCallback searchMovies;
  final Ref ref;

  SearchedMovieNotifier({required this.searchMovies, required this.ref})
      : super([]);

  Future<List<Movie>> searchMoviesByQuery(String query) async {
    final List<Movie> movies = await searchMovies(query);

    ref.read(searchQueryProvider.notifier).update((state) => query);
    state = movies;
    return movies;
  }
}
