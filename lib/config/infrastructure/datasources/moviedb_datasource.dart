import 'package:dio/dio.dart';
import 'package:neri_cinema/config/constants/environment.dart';
import 'package:neri_cinema/config/domain/datasources/movies_datasource.dart';
import 'package:neri_cinema/config/domain/entities/movie.dart';
import 'package:neri_cinema/config/infrastructure/mappers/movie.mapper.dart';
import 'package:neri_cinema/config/infrastructure/models/moviedb/moviedb_response.dart';

class MoviedbDatasource extends MoviesDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.theMovieDbKey,
        'language': 'pt-BR',
      },
    ),
  );

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing');

    final movieDBResponse = MoveDbResponse.fromJson(response.data);

    final List<Movie> movies = movieDBResponse.results
        .where((moviedb) => moviedb.posterPath != 'no-image.png')
        .map((moviedb) => MovieMapper.movieDbToEntity(moviedb))
        .toList();

    return movies;
  }
}
