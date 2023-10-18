import 'package:flutter/material.dart';
import 'package:jokermovies/common/constants/size_constants.dart';
import 'package:jokermovies/common/extension/size_extension.dart';
import 'package:jokermovies/domain/entities/movie_entity.dart';
import 'package:jokermovies/presentation/journeys/favorite_screen/favorite_movie_card_widget.dart';

class FavoriteMovieGridView extends StatelessWidget {
  final List<MovieEntity> movies;
  const FavoriteMovieGridView({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_8.w.toDouble()),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: movies.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
            crossAxisSpacing: Sizes.dimen_16.w.toDouble()),
        itemBuilder: (context, index) {
          return FavoriteMovieCardWidget(
            movie:movies[index],
          );
        },
      ),
    );
  }
}
