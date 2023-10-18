import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jokermovies/common/constants/size_constants.dart';
import 'package:jokermovies/common/extension/size_extension.dart';
import 'package:jokermovies/common/screenutil/screenutil.dart';
import 'package:jokermovies/data/core/api_constants.dart';
import 'package:jokermovies/domain/entities/movie_entity.dart';
import 'package:jokermovies/presentation/blocs/movie_backdrop/movie_backdrop_cubit.dart';

class MovieBackdropWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      alignment: Alignment.topCenter,
      heightFactor: 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(Sizes.dimen_20.w.toDouble()),
        ),
        child: Stack(
          children: <Widget>[
            FractionallySizedBox(
              heightFactor: 1,
              widthFactor: 1,
              child: BlocBuilder<MovieBackdropCubit, MovieEntity?>(
                builder: (context, movie) {
                  return CachedNetworkImage(
                    imageUrl:
                        '${ApiConstants.BASE_IMAGE_URL}${movie?.backdropPath}',
                    fit: BoxFit.fitHeight,
                  );
                },
              ),
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
              child: Container(
                width: ScreenUtil.screenWidth,
                height: 1,
                color: Colors.transparent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
