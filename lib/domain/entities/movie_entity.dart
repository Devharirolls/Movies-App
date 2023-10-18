import 'package:equatable/equatable.dart';
import 'package:jokermovies/domain/entities/movie_detail_entity.dart';

class MovieEntity extends Equatable {
  final String posterPath;
  final int id;
  final String backdropPath;
  final num voteAverage;
  final String title;
  final String releaseDate;
  final String? overview;

  const MovieEntity({
    required this.posterPath,
    this.overview,
    required this.id,
    required this.backdropPath,
    required this.voteAverage,
    required this.title,
    required this.releaseDate,
  }) : assert(id != null, 'Movie id must not be null');

  @override
  List<Object> get props => [id, title];

  @override
  bool get stringify => true;

  factory MovieEntity.fromMovieDetailEntity(
      MovieDetailEntity movieDetailEntity) {
    return MovieEntity(
        posterPath: movieDetailEntity.posterPath,
        id: movieDetailEntity.id,
        backdropPath: movieDetailEntity.backdropPath!,
        voteAverage: movieDetailEntity.voteAverage!,
        title: movieDetailEntity.title,
        releaseDate: movieDetailEntity.releaseDate!);
  }
}
