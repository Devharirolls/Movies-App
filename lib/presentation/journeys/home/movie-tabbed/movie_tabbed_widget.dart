import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jokermovies/common/constants/size_constants.dart';
import 'package:jokermovies/common/constants/tramslation_constant.dart';
import 'package:jokermovies/common/extension/size_extension.dart';
import 'package:jokermovies/common/extension/string_extenstion.dart';
import 'package:jokermovies/presentation/blocs/movie_tabbed/movie_tabbed_cubit.dart';
import 'package:jokermovies/presentation/journeys/home/movie-tabbed/movie_listview_builder.dart';
import 'package:jokermovies/presentation/journeys/home/movie-tabbed/movie_tabbed_constants.dart';
import 'package:jokermovies/presentation/journeys/home/movie-tabbed/tab_title_widget.dart';
import 'package:jokermovies/presentation/journeys/loading/loading_circle.dart';
import 'package:jokermovies/presentation/widgets/AppErrorwidget.dart';

class MovieTabbedWidget extends StatefulWidget {
  @override
  _MovieTabbedWidgetState createState() => _MovieTabbedWidgetState();
}

class _MovieTabbedWidgetState extends State<MovieTabbedWidget>
    with SingleTickerProviderStateMixin {
  MovieTabbedCubit get movieTabbedCubit =>
      BlocProvider.of<MovieTabbedCubit>(context);

  int currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    movieTabbedCubit.movieTabChanged(currentTabIndex: currentTabIndex);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieTabbedCubit, MovieTabbedState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(top: Sizes.dimen_4.h.toDouble()),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (var i = 0;
                      i < MovieTabbedConstants.movieTabs.length;
                      i++)
                    TabTitleWidget(
                      title: MovieTabbedConstants.movieTabs[i].title,
                      onTap: () => _onTabTapped(i),
                      isSelected: MovieTabbedConstants.movieTabs[i].index ==
                          state.currentTabIndex,
                    )
                ],
              ),
              if (state is MovieTabChanged)
                state.movies.isEmpty
                    ? Expanded(
                        child: Center(
                          child: Text(
                            TranslationConstants.noMovies.t(context)!,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      )
                    : Expanded(
                        child: MovieListViewBuilder(movies: state.movies),
                      ),
              if (state is MovieTabLoadError)
                Expanded(
                  child: AppErrorWidget(
                    errorType: state.errorType,
                    onPressed: () => movieTabbedCubit.movieTabChanged(
                      currentTabIndex: state.currentTabIndex,
                    ),
                  ),
                ),
              if (state is MovieTabLoading)
                Expanded(
                  child: Center(
                    child: LoadingCircle(
                      size: Sizes.dimen_100.w.toDouble(),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  void _onTabTapped(int index) {
    movieTabbedCubit.movieTabChanged(currentTabIndex: index);
  }
}
