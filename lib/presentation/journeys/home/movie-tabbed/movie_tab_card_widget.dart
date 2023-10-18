import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jokermovies/common/constants/route_constants.dart';
import 'package:jokermovies/common/constants/size_constants.dart';
import 'package:jokermovies/common/extension/size_extension.dart';
import 'package:jokermovies/common/extension/string_extenstion.dart';
import 'package:jokermovies/data/core/api_constants.dart';
import 'package:jokermovies/presentation/journeys/movie_detail/movie_detail_arugments.dart';
import 'package:jokermovies/presentation/journeys/movie_detail/movie_detail_screen.dart';
import 'package:jokermovies/presentation/themes/app_color.dart';

class MovieTabCardWidget extends StatelessWidget {
  final int movieId;
  final String title, posterPath;
  const MovieTabCardWidget(
      {super.key,
      required this.movieId,
      required this.title,
      required this.posterPath});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(RouteList.movieDetail,
            arguments: MovieDetailArguments(movieId));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(Sizes.dimen_16.w.toDouble()),
              child: CachedNetworkImage(
                imageUrl: '${ApiConstants.BASE_IMAGE_URL}$posterPath',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: Sizes.dimen_4.h.toDouble(),
            ),
            child: Text(title.intelliTrim(),
                maxLines: 1,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          )
        ],
      ),
    );
  }
}
