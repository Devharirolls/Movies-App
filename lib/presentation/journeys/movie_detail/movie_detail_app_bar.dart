import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jokermovies/common/constants/size_constants.dart';
import 'package:jokermovies/common/extension/size_extension.dart';
import 'package:jokermovies/domain/entities/movie_detail_entity.dart';
import 'package:jokermovies/domain/entities/movie_entity.dart';
import 'package:jokermovies/presentation/blocs/favorite/favorite_cubit.dart';

class MovieDetailAppBar extends StatelessWidget {
  final MovieDetailEntity movieDetailEntity;
  const MovieDetailAppBar({super.key, required this.movieDetailEntity});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.orange,
              size: Sizes.dimen_12.h.toDouble(),
            )),
        BlocBuilder<FavoriteCubit, FavoriteState>(
          builder: (context, state) {
            if (state is IsFavoriteMovie) {
              return GestureDetector(
                onTap: () =>  BlocProvider.of<FavoriteCubit>(context).toggleFavoriteMovie(
                  MovieEntity.fromMovieDetailEntity(movieDetailEntity),
                  state.isMovieFavorite,
                ),
                child: Icon(
                  state.isMovieFavorite
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: Colors.orange,
                  size: Sizes.dimen_12.h.toDouble(),
                ),
              );
            } else {
              return Icon(
                Icons.favorite_border,
                color: Colors.orange,
                size: Sizes.dimen_12.h.toDouble(),
              );
            }
          },
        )
      ],
    );
  }
}
