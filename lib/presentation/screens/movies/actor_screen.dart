import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/person_details.dart';
import 'package:cinemapedia/presentation/providers/actors/actor_detail_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ActorScreen extends ConsumerStatefulWidget {
  static const routeName = '/actor-screen';

  final String actorID;

  const ActorScreen({super.key, required this.actorID});

  @override
  ActorScreenState createState() => ActorScreenState();
}

class ActorScreenState extends ConsumerState<ActorScreen> {
  @override
  void initState() {
    super.initState();

    ref.read(actorDetailProvider.notifier).loadActor(widget.actorID);
  }

  @override
  Widget build(BuildContext context) {
    final actor = ref.watch(actorDetailProvider);

    if (actor[widget.actorID] == null) {
      return const Scaffold(
        body: CircularProgressIndicator(
          strokeWidth: 2,
        ),
      );
    }

    final person = actor[widget.actorID]!;

    return Scaffold(
      body: FadeInRight(
        child: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          scrollDirection: Axis.vertical,
          slivers: [
            SliverAppBar(
              title: Text(person.name),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(
                    (context, index) => _ActorDetail(person: person),
                    childCount: 1))
          ],
        ),
      ),
    );
  }
}

class _ActorDetail extends StatelessWidget {
  final Person person;

  const _ActorDetail({
    required this.person,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      width: 135,
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 8,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                person.profilePath!,
                height: 180,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        _ActorData(person: person),
        const SizedBox(
          height: 60,
        )
      ]),
    );
  }
}

class _ActorData extends StatelessWidget {
  const _ActorData({
    required this.person,
  });

  final Person person;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(left: 10, right: 10),
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  'Name: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(person.name)
              ],
            ),
            const SizedBox(height: 8), // Espaciado entre elementos

            Row(
              children: [
                const Text(
                  'Birthday: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(person.birthday != null
                    ? '${person.birthday?.month}-${person.birthday?.day}'
                    : 'No Data')
              ],
            ),
            const SizedBox(height: 8), // Espaciado entre elementos

            RichText(
                text: TextSpan(
              children: [
                const TextSpan(
                  text: 'Place of Birth: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text: person.placeOfBirth.isNotEmpty
                      ? person.placeOfBirth
                      : 'No Data',
                  style: const TextStyle(color: Colors.black),
                )
              ],
            )),
            const SizedBox(height: 8), // Espaciado entre elementos

            RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'Biography: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: person.biography!.isEmpty
                        ? 'No Data'
                        : person.biography,
                    style: const TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
