import 'package:flutter/material.dart';
import 'package:flutter_api_mvvm/data/model/movies.dart';
import 'package:flutter_api_mvvm/data/network/responses/network_response.dart';
import 'package:flutter_api_mvvm/data/repositories/movies_list_repository.dart';

import '../utils/showing_info/toast_message.dart';

class HomeViewModel with ChangeNotifier {
  final _homeRepository = MoviesListRepository();
  late NetworkResponse<MovieList> moviesList;
  void setMoviesList(NetworkResponse<MovieList> response) {
    moviesList = response;
    notifyListeners();
  }

  Future<void> getMoviesList(BuildContext context) async {
    try {
      setMoviesList(NetworkResponse.loading());
      MovieList movieList = await _homeRepository.getMovies();
      setMoviesList(NetworkResponse.completed(movieList));
    } catch (e) {
      setMoviesList(
        NetworkResponse.error(
          e.toString(),
        ),
      );
      flushBarErrorMessage(e.toString(), context);
    }
  }
}
