import 'package:dartz/dartz.dart';
import 'package:jokermovies/domain/entities/movie_detail_entity.dart';

import 'package:jokermovies/domain/entities/movie_params.dart';

import 'package:jokermovies/domain/repositories/movie_repository.dart';
import 'package:jokermovies/domain/usecases/usecase.dart';

import '../entities/app_error.dart';

class GetMovieDetail extends UseCase<MovieDetailEntity,MovieParams>{
  final MovieRepository repository;

  GetMovieDetail(this.repository);
  @override
  Future<Either<AppError ,MovieDetailEntity>> call(MovieParams movieParams) async {
    return await repository.getMovieDetail(movieParams.id);
  }
}
