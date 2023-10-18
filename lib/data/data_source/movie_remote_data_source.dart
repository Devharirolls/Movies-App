
import 'package:jokermovies/data/core/api_client.dart';
import 'package:jokermovies/data/models/cast_crew_result_data_model.dart';
import 'package:jokermovies/data/models/movie_detail_model.dart';
import 'package:jokermovies/data/models/movie_model.dart';
import 'package:jokermovies/data/models/movie_result_model.dart';
import 'package:jokermovies/data/models/video_model.dart';
import 'package:jokermovies/data/models/video_result_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getTrending();
  Future<List<MovieModel>> getPopular();
  Future<List<MovieModel>> getPlayingNow();
  Future<List<MovieModel>> getComingSoon();
    Future<List<MovieModel>> getSearchedMovies(String searchTerm);
  Future<MovieDetailModel> getMovieDetail(int id);
  Future<List<CastModel>> getCastCrew(int id);
  Future<List<VideoModel>> getVideos(int id);
}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  final ApiClient _client;

  MovieRemoteDataSourceImpl(this._client);

  @override
  Future<List<MovieModel>> getTrending() async {
    //String trenuri = Uri.parse('trending/movie/day') as String;
    //var url = Uri.parse('${ApiConstants.BASE_URL}trending/movie/day?api_key=${ApiConstants.API_KEY}');
    final response = await _client.get('trending/movie/day');
    final movies =
        MovieResultModel.fromJson(response as Map<String, dynamic>).movies;
    print(movies);
    return movies!;
  }

  @override
  Future<List<MovieModel>> getPopular() async {
    // String popuri = Uri.parse('movie/popular') as String;
    // var url = Uri.parse('${ApiConstants.BASE_URL}movie/popular?api_key=${ApiConstants.API_KEY}');
    final response = await _client.get('movie/popular');
    final movies =
        MovieResultModel.fromJson(response as Map<String, dynamic>).movies;
    print(movies);
    return movies!;
  }

  @override
  Future<List<MovieModel>> getComingSoon() async {
    final response = await _client.get('movie/upcoming');
    final movies =
        MovieResultModel.fromJson(response as Map<String, dynamic>).movies;
    print(movies);
    return movies!;
  }

  @override
  Future<List<MovieModel>> getPlayingNow() async {
    final response = await _client.get('movie/now_playing');
    final movies =
        MovieResultModel.fromJson(response as Map<String, dynamic>).movies;
    print(movies);
    return movies!;
  }

  @override
  Future<MovieDetailModel> getMovieDetail(int id) async {
    final response = await _client.get('movie/$id');
    final movie = MovieDetailModel.fromJson(response as Map<String, dynamic>);
    print(movie);
    return movie;
  }

  @override
  Future<List<CastModel>> getCastCrew(int id) async {
    final response = await _client.get('movie/$id/credits');
    final cast = CastCrewResultModel.fromJson(response).cast;
    print(cast);
    return cast;
  }
  
  @override
  Future<List<VideoModel>> getVideos(int id)async {
     final response = await _client.get('movie/$id/videos');
    final videos = VideoResultModel.fromJson(response).videos;
    print(videos);
    return videos;
  }
  
  @override
  Future<List<MovieModel>> getSearchedMovies(String searchTerm)async {
    final response = await _client.get(
      'search/movie',
      params: {
        'query':searchTerm,
      } );
    final movies = MovieResultModel.fromJson(response as Map<String, dynamic>).movies;
    print(movies);
    return movies!;
  }
}
