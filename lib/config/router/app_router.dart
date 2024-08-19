import 'package:cinemapedia/presentation/screens/movies/actor_screen.dart';
import 'package:cinemapedia/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
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
]);
