import 'package:flutter/material.dart';
import 'package:jokermovies/domain/entities/movie_entity.dart';
import 'package:jokermovies/presentation/journeys/home/Movie_carousel/movie_backdrop_widget.dart';
import 'package:jokermovies/presentation/journeys/home/Movie_carousel/movie_data_widget.dart';
import 'package:jokermovies/presentation/journeys/home/Movie_carousel/movie_page_view.dart';
import 'package:jokermovies/presentation/widgets/movie_app_bar.dart';
import 'package:jokermovies/presentation/widgets/separator.dart';

class MovieCarouselWidget extends StatelessWidget {
  final List<MovieEntity> movies;
  final int defaultIndex;
  const MovieCarouselWidget(
      {super.key, required this.movies, this.defaultIndex = 0})
      : assert(defaultIndex >= 0, 'deafultindex cannot be less than 0');

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        MovieBackdropWidget(),
        Column(
          children: [
            MovieAppBar(),
            MoviePageView(
              movies: movies,
              initialpage: defaultIndex,
            ),

            //  SizedBox(height: 5,),

            MovieDataWidget(),
            Separator(),
          ],
        ),
      ],
    );
  }
}
