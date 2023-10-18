import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jokermovies/common/constants/route_constants.dart';
import 'package:jokermovies/common/constants/size_constants.dart';
import 'package:jokermovies/common/extension/size_extension.dart';
import 'package:jokermovies/data/core/api_constants.dart';
import 'package:jokermovies/domain/entities/movie_entity.dart';
import 'package:jokermovies/presentation/journeys/movie_detail/movie_detail_arugments.dart';
import 'package:jokermovies/presentation/journeys/movie_detail/movie_detail_screen.dart';
import 'package:jokermovies/presentation/themes/theme_text.dart';

class SearchMovieCard extends StatelessWidget {
  final MovieEntity movie;

  const SearchMovieCard({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          RouteList.movieDetail,
          arguments: MovieDetailArguments(movie.id),
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Sizes.dimen_4.w.toDouble(),
          vertical: Sizes.dimen_2.h.toDouble(),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(Sizes.dimen_8.w.toDouble()),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(Sizes.dimen_4.w.toDouble()),
                child: CachedNetworkImage(
                  imageUrl: '${ApiConstants.BASE_IMAGE_URL}${movie.posterPath}',
                  width: Sizes.dimen_64.w.toDouble(),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    movie.title,
                    style: TextStyle(
                        fontSize: 27,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    movie.overview ?? '',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w100,
                        color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
