import 'package:dartz/dartz.dart';
import 'package:jokermovies/domain/entities/cast_entity.dart';

import 'package:jokermovies/domain/entities/movie_params.dart';

import 'package:jokermovies/domain/repositories/movie_repository.dart';
import 'package:jokermovies/domain/usecases/usecase.dart';

import '../entities/app_error.dart';

class GetCast extends UseCase<List<CastEntity>,MovieParams>{
  final MovieRepository repository;

  GetCast(this.repository);
  @override
  Future<Either<AppError ,List<CastEntity>>> call(MovieParams movieParams) async {
    return await repository.getCastCrew(movieParams.id);
  }
}