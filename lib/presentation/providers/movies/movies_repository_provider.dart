import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neri_cinema/config/domain/repositories/movies_repository.dart';
import 'package:neri_cinema/config/infrastructure/datasources/moviedb_datasource.dart';
import 'package:neri_cinema/config/infrastructure/repositories/movie_repository_impl.dart';

final movieRepositoryProvider = Provider<MoviesRepository>((ref) {
  return MovieRepositoryImpl(MoviedbDatasource());
});
