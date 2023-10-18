import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jokermovies/common/constants/tramslation_constant.dart';
import 'package:jokermovies/common/extension/string_extenstion.dart';
import 'package:jokermovies/di/get_it.dart';
import 'package:jokermovies/presentation/blocs/favorite/favorite_cubit.dart';
import 'package:jokermovies/presentation/journeys/favorite_screen/favorite_movie_grid_view.dart';
import 'package:jokermovies/presentation/themes/app_color.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late FavoriteCubit _favoriteCubit;

  @override
  void initState() {
    _favoriteCubit = getItInstance<FavoriteCubit>();
    _favoriteCubit.loadFavoriteMovie();
    super.initState();
  }

  @override
  void dispose() {
    _favoriteCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            TranslationConstants.favoriteMovies.t(context)!,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: AppColor.vulcan,
      ),
      body: BlocProvider.value(
        value: _favoriteCubit,
        child: BlocBuilder<FavoriteCubit, FavoriteState>(
          builder: (context, state) {
            if (state is FavoriteMoviesLoaded) {
              if (state.movies.isEmpty) {
                Center(
                  child: Text(
                    TranslationConstants.noFavoriteMovie.t(context)!,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.white),
                  ),
                );
              }
              return FavoriteMovieGridView(
                movies: state.movies,
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
