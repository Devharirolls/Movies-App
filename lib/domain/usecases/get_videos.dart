import 'package:dartz/dartz.dart';
import 'package:jokermovies/domain/entities/movie_entity.dart';
import 'package:jokermovies/domain/entities/movie_params.dart';
import 'package:jokermovies/domain/entities/no_params.dart';
import 'package:jokermovies/domain/entities/video_entity.dart';
import 'package:jokermovies/domain/repositories/movie_repository.dart';
import 'package:jokermovies/domain/usecases/usecase.dart';

import '../entities/app_error.dart';

class GetVideos extends UseCase<List<VideoEntity>,MovieParams>{
  final MovieRepository repository;

  GetVideos(this.repository);
  @override
  Future<Either<AppError ,List<VideoEntity>>> call(MovieParams movieParams) async {
    return await repository.getVideos(movieParams.id);
  }
}
