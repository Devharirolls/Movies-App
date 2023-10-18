import 'package:jokermovies/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:jokermovies/domain/entities/movie_entity.dart';
import 'package:jokermovies/domain/entities/movie_params.dart';
import 'package:jokermovies/domain/repositories/movie_repository.dart';
import 'package:jokermovies/domain/usecases/usecase.dart';

class CheckIfFavoriteMovie extends UseCase<bool, MovieParams> {
  final MovieRepository movieRepository;

  CheckIfFavoriteMovie(this.movieRepository);

  @override
  Future<Either<AppError, bool>> call(MovieParams movieParams) async {
    return await movieRepository.checkIfMovieFavorite(movieParams.id);
  }
}
