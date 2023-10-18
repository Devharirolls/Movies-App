import 'package:jokermovies/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:jokermovies/domain/entities/movie_params.dart';
import 'package:jokermovies/domain/repositories/movie_repository.dart';
import 'package:jokermovies/domain/usecases/usecase.dart';

class DeleteFavoriteMovie extends UseCase<void, MovieParams> {
  final MovieRepository movieRepository;

  DeleteFavoriteMovie(this.movieRepository);

  @override
  Future<Either<AppError, void>> call(MovieParams movieParams) async {
    return await movieRepository.deleteFavoriteMovie(movieParams.id);
  }
}
