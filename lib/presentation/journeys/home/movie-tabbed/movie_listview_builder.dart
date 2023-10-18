import 'package:flutter/material.dart';
import 'package:jokermovies/common/extension/size_extension.dart';
import 'package:jokermovies/domain/entities/movie_entity.dart';
import 'package:jokermovies/presentation/journeys/home/movie-tabbed/movie_tab_card_widget.dart';

class MovieListViewBuilder extends StatelessWidget {
  final List<MovieEntity> movies;
  const MovieListViewBuilder({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(vertical: 6.h.toDouble()),
    child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final MovieEntity movie = movies[index];
          return MovieTabCardWidget(
              movieId: movie.id,
              title: movie.title,
              posterPath: movie.posterPath);
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            width: 14.w.toDouble(),
          );
        },
        itemCount: movies.length),
    );
  }
}
