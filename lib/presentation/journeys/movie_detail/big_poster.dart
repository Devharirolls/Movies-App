import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jokermovies/common/constants/size_constants.dart';
import 'package:jokermovies/common/extension/num_extenstions.dart';
import 'package:jokermovies/common/extension/size_extension.dart';
import 'package:jokermovies/common/screenutil/screenutil.dart';
import 'package:jokermovies/data/core/api_constants.dart';
import 'package:jokermovies/domain/entities/movie_detail_entity.dart';
import 'package:jokermovies/presentation/journeys/movie_detail/movie_detail_app_bar.dart';
import 'package:jokermovies/presentation/themes/app_color.dart';
import 'package:jokermovies/presentation/themes/theme_text.dart';

class BigPoster extends StatelessWidget {
  final MovieDetailEntity movie;
  const BigPoster({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Theme.of(context).primaryColor.withOpacity(0.3),
                Theme.of(context).primaryColor,
              ])),
          child: CachedNetworkImage(
            imageUrl:
                // 'https://image.tmdb.org/t/p/original/i8dshLvq4LE3s0v8PrkDdUyb1ae.jpg',
                '${ApiConstants.BASE_IMAGE_URL}${movie.posterPath}',
            width: ScreenUtil.screenWidth,
          ),
        ),
        Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: ListTile(
              title: Text(
                movie.title,
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              subtitle: Text(
                movie.releaseDate!,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              trailing: Text(
                movie.voteAverage!.convertToPercentageString(),
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: AppColor.violet),
              ),
            )),
        Positioned(
            left: Sizes.dimen_16.w.toDouble(),
            right: Sizes.dimen_16.w.toDouble(),
            top: ScreenUtil.statusBarHeight + Sizes.dimen_4.h,
            child: MovieDetailAppBar(
              movieDetailEntity: movie,
            ))
      ],
    );
  }
}
