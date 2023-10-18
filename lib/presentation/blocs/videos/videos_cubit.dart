import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:jokermovies/domain/entities/app_error.dart';
import 'package:jokermovies/domain/entities/movie_params.dart';
import 'package:jokermovies/domain/entities/video_entity.dart';
import 'package:jokermovies/domain/usecases/get_videos.dart';


part 'videos_state.dart';

class VideosCubit extends Cubit<VideosState> {
  final GetVideos getVideos;

  VideosCubit({
    required this.getVideos,
  }) : super(VideosInitial());

  void loadVideos(int movieId) async {
    final Either<AppError, List<VideoEntity>> eitherVideoResponse =
        await getVideos(MovieParams(movieId));

    emit(eitherVideoResponse.fold(
      (l) => NoVideos(),
      (r) => VideosLoaded(r),
    ));
  }
}
