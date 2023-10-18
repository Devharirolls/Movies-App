import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jokermovies/common/constants/size_constants.dart';
import 'package:jokermovies/common/constants/tramslation_constant.dart';
import 'package:jokermovies/common/extension/size_extension.dart';
import 'package:jokermovies/common/extension/string_extenstion.dart';
import 'package:jokermovies/di/get_it.dart';
import 'package:jokermovies/presentation/blocs/cast/cast_cubit.dart';
import 'package:jokermovies/presentation/blocs/favorite/favorite_cubit.dart';
import 'package:jokermovies/presentation/blocs/videos/videos_cubit.dart';
import 'package:jokermovies/presentation/blocs/movie_detail/movie_detail_cubit.dart';
import 'package:jokermovies/presentation/journeys/movie_detail/big_poster.dart';
import 'package:jokermovies/presentation/journeys/movie_detail/cast_widget.dart';
import 'package:jokermovies/presentation/journeys/movie_detail/movie_detail_arugments.dart';
import 'package:jokermovies/presentation/journeys/movie_detail/videos_widget.dart';

class MovieDetailScreen extends StatefulWidget {
  final MovieDetailArguments movieDetailArguments;

  const MovieDetailScreen({
    Key? key,
    required this.movieDetailArguments,
  }) : super(key: key);

  @override
  _MovieDetailScreenState createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  late MovieDetailCubit _movieDetailCubit;
  late CastCubit _castCubit;
  late VideosCubit _videosCubit;
  late FavoriteCubit _favoriteCubit;

  @override
  void initState() {
    super.initState();
    _movieDetailCubit = getItInstance<MovieDetailCubit>();
    _castCubit = _movieDetailCubit.castBloc;
    _videosCubit = _movieDetailCubit.videosCubit;
    _favoriteCubit = _movieDetailCubit.favoriteCubit;
    _movieDetailCubit.loadMovieDetail(widget.movieDetailArguments.movieId);
  }

  @override
  void dispose() {
    _movieDetailCubit.close();
    _castCubit.close();
    _videosCubit.close();
    _favoriteCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: _movieDetailCubit),
          BlocProvider.value(value: _castCubit),
          BlocProvider.value(value: _videosCubit),
          BlocProvider.value(value: _favoriteCubit),
        ],
        child: BlocBuilder<MovieDetailCubit, MovieDetailState>(
          builder: (context, state) {
            if (state is MovieDetailLoaded) {
              final movieDetail = state.movieDetailEntity;
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    BigPoster(
                      movie: movieDetail,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Sizes.dimen_16.w.toDouble(),
                        vertical: Sizes.dimen_8.h.toDouble(),
                      ),
                      child: Text(
                        movieDetail.overview ?? '',
                        style: TextStyle(fontSize: 20, color: Colors.white70),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: Sizes.dimen_16.w.toDouble()),
                      child: Text(
                        TranslationConstants.cast.t(context)!,
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    CastWidget(),
                    VideosWidget(videosCubit: _videosCubit),
                  ],
                ),
              );
            } else if (state is MovieDetailError) {
              return Container();
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
