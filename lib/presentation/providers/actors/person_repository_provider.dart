import 'package:cinemapedia/infrastructure/datasources/moviedb_person_datasource.dart';
import 'package:cinemapedia/infrastructure/repositories/person_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final personRepositoryProvider = Provider((ref) {
  return PersonRepositoryImpl(MoviedbPersonDatasource());
});
