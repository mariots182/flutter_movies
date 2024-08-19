import 'package:cinemapedia/infrastructure/models/moviedb/person_details.dart';
import 'package:cinemapedia/presentation/providers/actors/person_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorDetailProvider =
    StateNotifierProvider<ActorDetailNotifier, Map<String, Person>>((ref) {
  final personRepository = ref.watch(personRepositoryProvider);

  return ActorDetailNotifier(getActor: personRepository.getPerson);
});

typedef GetActorCallback = Future<Person> Function(String actorID);

class ActorDetailNotifier extends StateNotifier<Map<String, Person>> {
  final GetActorCallback getActor;

  ActorDetailNotifier({required this.getActor}) : super({});

  Future<void> loadActor(String actorID) async {
    if (state[actorID] != null) return;

    final Person actor = await getActor(actorID);

    state = {...state, actorID: actor};
  }
}
