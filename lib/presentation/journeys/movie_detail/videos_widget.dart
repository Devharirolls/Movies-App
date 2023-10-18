import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jokermovies/common/constants/route_constants.dart';
import 'package:jokermovies/common/constants/tramslation_constant.dart';
import 'package:jokermovies/common/extension/string_extenstion.dart';
import 'package:jokermovies/presentation/blocs/videos/videos_cubit.dart';
import 'package:jokermovies/presentation/journeys/watch_video/watch_video_arguments.dart';
import 'package:jokermovies/presentation/journeys/watch_video/watch_video_screen.dart';
import 'package:jokermovies/presentation/widgets/button.dart';

class VideosWidget extends StatelessWidget {
  final VideosCubit videosCubit;
  const VideosWidget({super.key, required this.videosCubit});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: videosCubit,
      builder: (context, state) {
        if (state is VideosLoaded && state.videos.iterator.moveNext()) {
          final _videos = state.videos;
          return Button(
              text: TranslationConstants.watchTrailers.t(context)!,
              onPressed: () {
                Navigator.of(context).pushNamed(RouteList.watchTrailer,
                    arguments: WatchVideoArguments(_videos));
              });
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
