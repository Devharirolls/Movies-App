import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jokermovies/common/constants/size_constants.dart';
import 'package:jokermovies/common/extension/size_extension.dart';
import 'package:jokermovies/common/screenutil/screenutil.dart';
import 'package:jokermovies/presentation/blocs/search_movie/search_movie_cubit.dart';
import 'package:jokermovies/presentation/journeys/favorite_screen/favorite_screen.dart';
import 'package:jokermovies/presentation/journeys/movie_detail/movie_detail_arugments.dart';
import 'package:jokermovies/presentation/journeys/movie_detail/movie_detail_screen.dart';
import 'package:jokermovies/presentation/journeys/search_movie/custom_search_movie_delegate.dart';
import 'package:jokermovies/presentation/widgets/logo.dart';

class MovieAppBar extends StatelessWidget {
  const MovieAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: ScreenUtil.statusBarHeight + Sizes.dimen_4.h,
          left: Sizes.dimen_16.w.toDouble(),
          right: Sizes.dimen_16.w.toDouble()),
      child: Row(
        children: <Widget>[
          IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: SvgPicture.asset(
              'assets/svgs/menu.svg',
              height: Sizes.dimen_12.h.toDouble(),
            ),
          ),
          Expanded(
            child: const Logo(height: Sizes.dimen_14),
          ),
          IconButton(
              onPressed: () {
                showSearch(
                    context: context,
                    delegate: CustomSearchDelegate(
                        BlocProvider.of<SearchMovieCubit>(context)));
              },
              icon: Icon(
                Icons.search,
                color: Colors.white,
                size: Sizes.dimen_12.h.toDouble(),
              ))
        ],
      ),
    );
  }
}
