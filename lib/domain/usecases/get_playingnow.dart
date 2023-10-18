import 'package:dartz/dartz.dart';
import 'package:jokermovies/domain/entities/movie_entity.dart';
import 'package:jokermovies/domain/entities/no_params.dart';
import 'package:jokermovies/domain/repositories/movie_repository.dart';
import 'package:jokermovies/domain/usecases/usecase.dart';

import '../entities/app_error.dart';

class GetPlayingNow extends UseCase<List<MovieEntity>,NoParams>{
  final MovieRepository repository;

  GetPlayingNow(this.repository);
@override
  Future<Either<AppError ,List<MovieEntity>>> call(NoParams noParams) async {
    return await repository.getPlayingNow();
  }
}
