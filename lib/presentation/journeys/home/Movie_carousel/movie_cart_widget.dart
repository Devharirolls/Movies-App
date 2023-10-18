import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jokermovies/common/constants/route_constants.dart';
import 'package:jokermovies/common/constants/size_constants.dart';
import 'package:jokermovies/common/extension/size_extension.dart';
import 'package:jokermovies/data/core/api_constants.dart';
import 'package:jokermovies/presentation/journeys/movie_detail/movie_detail_arugments.dart';
import 'package:jokermovies/presentation/journeys/movie_detail/movie_detail_screen.dart';

class MovieCartWidget extends StatelessWidget {
  final int movieId;
  final String posterPath;
  const MovieCartWidget(
      {super.key, required this.movieId, required this.posterPath});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 32,
      borderRadius: BorderRadius.circular(Sizes.dimen_16.w.toDouble()),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(RouteList.movieDetail,
              arguments: MovieDetailArguments(movieId));
        },
        child: ClipRRect(
            borderRadius: BorderRadius.circular(Sizes.dimen_16.w.toDouble()),
            child: CachedNetworkImage(
              imageUrl: '${ApiConstants.BASE_IMAGE_URL}$posterPath',
              fit: BoxFit.cover,
            )),
      ),
    );
  }
}
