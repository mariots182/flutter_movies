import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nowPlayingMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>  ((ref){

    return MoviesNotifier();

});


class MoviesNotifier extends StateNotifier<List<Movie>>{
  
  MoviesNotifier():super([]);
  
}