import 'package:dartz/dartz.dart';
import 'package:jokermovies/domain/entities/movie_entity.dart';
import 'package:jokermovies/domain/entities/movie_ssearch_params.dart';

import 'package:jokermovies/domain/repositories/movie_repository.dart';
import 'package:jokermovies/domain/usecases/usecase.dart';

import '../entities/app_error.dart';

class SearchMovies extends UseCase<List<MovieEntity>,MovieSearchParams>{
  final MovieRepository repository;

  SearchMovies(this.repository);
  @override
  Future<Either<AppError ,List<MovieEntity>>> call(MovieSearchParams searchParams) async {
    return await repository.getSearchedMovies(searchParams.searchTerm);
  }
}
