import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jokermovies/common/constants/size_constants.dart';
import 'package:jokermovies/common/constants/tramslation_constant.dart';
import 'package:jokermovies/common/extension/size_extension.dart';
import 'package:jokermovies/common/extension/string_extenstion.dart';
import 'package:jokermovies/domain/entities/app_error.dart';
import 'package:jokermovies/presentation/blocs/search_movie/search_movie_cubit.dart';
import 'package:jokermovies/presentation/journeys/search_movie/search_movie_card.dart';
import 'package:jokermovies/presentation/themes/app_color.dart';
import 'package:jokermovies/presentation/themes/theme_text.dart';
import 'package:jokermovies/presentation/widgets/AppErrorwidget.dart';

class CustomSearchDelegate extends SearchDelegate {
  final SearchMovieCubit searchMovieCubit;

  CustomSearchDelegate(this.searchMovieCubit);

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
        inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
          fontSize: 30, color: Colors.grey, fontWeight: FontWeight.w500),
    ));
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: query.isEmpty
              ? null
              : () {
                  query = '';
                },
          icon: Icon(
            Icons.clear,
            color: query.isEmpty ? Colors.grey : AppColor.royalBlue,
          ))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return GestureDetector(
      onTap: () {
        close(context, null);
      },
      child: Icon(
        Icons.arrow_back_ios,
        color: Colors.white,
        size: Sizes.dimen_12.h.toDouble(),
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    //SearchMovieBloc.add
    searchMovieCubit.searchTermChanged(query);

    return BlocBuilder<SearchMovieCubit, SearchMovieState>(
        bloc: searchMovieCubit,
        builder: (context, state) {
          if (state is SearchMovieError) {
            return AppErrorWidget(
              errorType: AppErrorType.api,
              onPressed: () => searchMovieCubit.searchTermChanged(query),
            );
          } else if (state is SearchMovieLoaded) {
            final movies = state.movies;
            if (movies.isEmpty) {
              return Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.w.toDouble(),
                  ),
                  child: Text(
                    TranslationConstants.noMoviesSearched.t(context)!,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              );
            }
            return ListView.builder(
              itemCount: movies.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) =>
                  SearchMovieCard(movie: movies[index]),
            );
          } else {
            return const SizedBox.shrink();
          }
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return SizedBox.shrink();
  }
}
