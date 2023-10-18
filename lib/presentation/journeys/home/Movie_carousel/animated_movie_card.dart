import 'package:flutter/material.dart';
import 'package:jokermovies/common/constants/size_constants.dart';
import 'package:jokermovies/common/extension/size_extension.dart';
import 'package:jokermovies/common/screenutil/screenutil.dart';
import 'package:jokermovies/presentation/journeys/home/Movie_carousel/movie_cart_widget.dart';

class AnimatedMovieCardWidget extends StatefulWidget {
  final int index;
  final PageController pageController;
  final String posterPath;
  final int movieId;
  const AnimatedMovieCardWidget(
      {super.key,
      required this.index,
      required this.pageController,
      required this.posterPath,
      required this.movieId});

  @override
  State<AnimatedMovieCardWidget> createState() =>
      _AnimatedMovieCardWidgetState();
}

class _AnimatedMovieCardWidgetState extends State<AnimatedMovieCardWidget> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: widget.pageController,
        builder: (context, child) {
          double value = 1;
          if (widget.pageController.position.haveDimensions) {
            value = (widget.pageController.page ?? 0) - widget.index;
            value = (1 - (value.abs() * 0.1)).clamp(0.0, 1.0);
            return Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                height: Curves.easeIn.transform(value) *
                    ScreenUtil.screenHeight *
                    0.35,
                width: Sizes.dimen_230,
                child: child,
              ),
            );
          } else {
            return Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                height: Curves.easeIn
                        .transform(widget.index == 0 ? value : value * 0.5) *
                    ScreenUtil.screenHeight *
                    0.35,
                width: Sizes.dimen_230.w.toDouble(),
                child: child,
              ),
            );
          }
        },
        child: MovieCartWidget(
            movieId: widget.movieId, posterPath: widget.posterPath));
  }
}
