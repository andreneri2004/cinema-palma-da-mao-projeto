import 'package:neri_cinema/config/domain/entities/movie.dart';
import 'package:neri_cinema/config/infrastructure/models/moviedb/movie_moviedb.dart';

class MovieMapper {
  static Movie movieDbToEntity(MovieMovieDb movieDb) => Movie(
    adult: movieDb.adult,
    backdropPath: (movieDb.backdropPath != '')
        ? 'https://image.tmdb.org/t/p/w500${movieDb.backdropPath}'
        : 'https://img.freepik.com/vetores-premium/nenhuma-foto-disponivel-icone-vetorial-simbolo-de-imagem-padrao-imagem-em-breve-para-site-ou-aplicativo-movel_87543-18055.jpg?w=500',
    genreIds: movieDb.genreIds.map((e) => e.toString()).toList(),
    id: movieDb.id,
    originalLanguage: movieDb.originalLanguage,
    originalTitle: movieDb.originalTitle,
    overview: movieDb.overview,
    popularity: movieDb.popularity,
    posterPath: (movieDb.posterPath != '')
        ? 'https://image.tmdb.org/t/p/w500${movieDb.posterPath}'
        : 'no-image.png',
    releaseDate: movieDb.releaseDate,
    title: movieDb.title,
    video: movieDb.video,
    voteAverage: movieDb.voteAverage,
    voteCount: movieDb.voteCount,
  );
}
