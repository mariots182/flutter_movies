import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "package:cinemapedia/presentation/providers/movies/movies_loader_provider.dart";
import "package:cinemapedia/presentation/providers/providers.dart";
import "package:cinemapedia/presentation/widgets/movies/movie_horizontal_listview.dart";
import "package:cinemapedia/presentation/widgets/movies/movies_slideshow.dart";
import "package:cinemapedia/presentation/widgets/shared/full_screen_loader.dart";

import "../../widgets/shared/custom_appbar.dart";

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final initialLoading = ref.watch(initialLoadingProvider);

    if (initialLoading) return const FullScreenLoader();

    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);
    final slideShowMovies = ref.watch(moviesSlideshowProvider);

    return CustomScrollView(slivers: [
      const SliverAppBar(
        floating: true,
        flexibleSpace: FlexibleSpaceBar(
          title: CustomAppbar(),
        ),
      ),
      SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
        return Column(children: [
          MoviesSlideshow(movies: slideShowMovies),
          MovieHorizontalListview(
            movies: nowPlayingMovies,
            title: "En cines",
            subtitle: "Lunes 20",
            loadNextPage: () {
              ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
            },
          ),
          MovieHorizontalListview(
            movies: upcomingMovies,
            title: "Proximamente",
            subtitle: "En este mes",
            loadNextPage: () {
              ref.read(upcomingMoviesProvider.notifier).loadNextPage();
            },
          ),
          MovieHorizontalListview(
            movies: popularMovies,
            title: "Populares",
            loadNextPage: () {
              ref.read(popularMoviesProvider.notifier).loadNextPage();
            },
          ),
          MovieHorizontalListview(
            movies: topRatedMovies,
            title: "Mejor calificadas",
            subtitle: "Siempre",
            loadNextPage: () {
              ref.read(topRatedMoviesProvider.notifier).loadNextPage();
            },
          ),
          const SizedBox(
            height: 10,
          )
        ]);
      }, childCount: 1))
    ]);
  }
}
