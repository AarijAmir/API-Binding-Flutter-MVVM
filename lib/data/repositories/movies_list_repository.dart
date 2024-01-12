import 'package:flutter_api_mvvm/data/model/movies.dart';
import 'package:flutter_api_mvvm/data/network/apis/movies_list_api.dart';

class MoviesListRepository {
  final MoviesListAPI _moviesListAPI = MoviesListAPI();
  Future<MovieList> getMovies() async => await _moviesListAPI.getMovies();
}
