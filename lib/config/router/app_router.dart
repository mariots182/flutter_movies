import 'package:go_router/go_router.dart';

import 'package:cinemapedia/presentation/screens/movies/actor_screen.dart';
import 'package:cinemapedia/presentation/screens/screens.dart';

final appRouter = GoRouter(initialLocation: '/home/0', routes: [
  GoRoute(
      path: '/home/:page',
      name: HomeScreen.name,
      builder: (context, state) {
        final pageIndex = (state.pathParameters['page'] ?? 0).toString();

        return HomeScreen(pageIndex: int.parse(pageIndex));
      },
      routes: [
        GoRoute(
            path: 'movie/:id',
            name: MovieScreen.routeName,
            builder: (context, state) {
              final movieID = state.pathParameters['id'] ?? 'no-id';

              return MovieScreen(
                movieID: movieID,
              );
            }),
        GoRoute(
            path: 'actor/:id',
            name: ActorScreen.routeName,
            builder: (context, state) {
              final actorID = state.pathParameters['id'] ?? 'no-id';

              return ActorScreen(
                actorID: actorID,
              );
            })
      ]),
  GoRoute(path: '/', redirect: (_, __) => '/home/0')
]);



  // ShellRoute(
  //     builder: (context, state, child) {
  //       return HomeScreen(childlView: child);
  //     },
  //     routes: [
  //       GoRoute(
  //           path: '/home/:page',
  //           builder: (context, state) {
  //             return const HomeScreen();
  //           },
  //           routes: [
  //             GoRoute(
  //                 path: 'movie/:id',
  //                 name: MovieScreen.routeName,
  //                 builder: (context, state) {
  //                   final movieID = state.pathParameters['id'] ?? 'no-id';

  //                   return MovieScreen(
  //                     movieID: movieID,
  //                   );
  //                 }),
  //             GoRoute(
  //                 path: 'actor/:id',
  //                 name: ActorScreen.routeName,
  //                 builder: (context, state) {
  //                   final actorID = state.pathParameters['id'] ?? 'no-id';

  //                   return ActorScreen(
  //                     actorID: actorID,
  //                   );
  //                 })
  //           ]),
  //       GoRoute(
  //         path: '/favorites',
  //         builder: (context, state) => const FavoritesView(),
  //       ),
  //     ])
