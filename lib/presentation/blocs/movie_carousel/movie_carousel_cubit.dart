import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jokermovies/domain/entities/app_error.dart';
import 'package:jokermovies/domain/entities/movie_entity.dart';
import 'package:jokermovies/domain/entities/no_params.dart';
import 'package:jokermovies/domain/usecases/get_trending.dart';
import 'package:jokermovies/presentation/blocs/loading/loading_cubit.dart';
import 'package:jokermovies/presentation/blocs/movie_backdrop/movie_backdrop_cubit.dart';

part 'movie_carousel_state.dart';

class MovieCarouselCubit extends Cubit<MovieCarouselState> {
  final GetTrending getTrending;
  final MovieBackdropCubit movieBackdropCubit;
  final LoadingCubit loadingCubit;

  MovieCarouselCubit({
    required this.getTrending,
    required this.movieBackdropCubit,
    required this.loadingCubit,
  }) : super(MovieCarouselInitial());

  void loadCarousel({int defaultIndex = 0}) async {
    loadingCubit.show();
    final moviesEither = await getTrending(NoParams());
    emit(moviesEither.fold(
      (l) => MovieCarouselError(l.appErrorType),
      (movies) {
        movieBackdropCubit.backdropChanged(movies[defaultIndex]);
        return MovieCarouselLoaded(
          movies: movies,
          defaultIndex: defaultIndex,
        );
      },
    ));
    loadingCubit.hide();
  }
}

// class MovieCarouselBlocBloc extends Bloc<MovieCarouselBlocEvent, MovieCarouselBlocState> {
//   final GetTrending getTrending;
//   final MovieBackdropBloc moviebackdropBloc;
//   MovieCarouselBlocBloc( {required this.getTrending, required this.moviebackdropBloc}) : super(MovieCarouselBlocInitial()) {
//     on<MovieCarouselBlocEvent>((event, emit)async* {
//        if (event is CarouselLoadEvent) {
//       final moviesEither = await getTrending(NoParams());
//       yield moviesEither.fold((l) => MovieCarouselError(l.appErrorType),
//           (movies) {
//         moviebackdropBloc
//             .add(MovieBackdropChangedEvent(movies[event.defaultIndex]));
//         return MovieCarouselLoaded(
//             movies: movies, defaultIndex: event.defaultIndex);
//       });
//     }
//     });
//   }
// }


// class MovieCarouselBlocBloc
//     extends Bloc<MovieCarouselBlocEvent, MovieCarouselBlocState> {
//   final GetTrending getTrending;
//   MovieCarouselBlocBloc(this.getTrending) : super(MovieCarouselBlocInitial()) {
//     // ignore: void_checks
//     on<MovieCarouselBlocEvent>((event, emit) async* {
//       if (event is CarouselLoadEvent) {
//       final moviesEither = await getTrending(NoParams());
//       // ignore: void_checks
//       yield moviesEither.fold((l) => MovieCarouselError(), (movies) {
//         return MovieCarouselLoaded(
//             movies: movies, defaultIndex: event.defaultIndex);
//       }
//       );
//     }  
//     }
//     );
//   }
// }
