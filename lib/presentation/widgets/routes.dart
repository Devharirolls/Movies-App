import 'package:flutter/material.dart';
import 'package:jokermovies/common/constants/route_constants.dart';
import 'package:jokermovies/presentation/journeys/favorite_screen/favorite_screen.dart';
import 'package:jokermovies/presentation/journeys/home/home_screen.dart';
import 'package:jokermovies/presentation/journeys/login/login_screen.dart';
import 'package:jokermovies/presentation/journeys/movie_detail/movie_detail_arugments.dart';
import 'package:jokermovies/presentation/journeys/movie_detail/movie_detail_screen.dart';
import 'package:jokermovies/presentation/journeys/watch_video/watch_video_arguments.dart';
import 'package:jokermovies/presentation/journeys/watch_video/watch_video_screen.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoutes(RouteSettings setting) => {
       RouteList.initial: (context) =>const LoginScreen(),
        RouteList.home: (context) => HomeScreen(),
        RouteList.movieDetail: (context) => MovieDetailScreen(
              movieDetailArguments: setting.arguments as MovieDetailArguments,
            ),
        RouteList.watchTrailer: (context) => WatchVideoScreen(
              watchVideoArguments: setting.arguments as WatchVideoArguments,
            ),
        RouteList.favorite: (context) => const FavoriteScreen(),
      };
}