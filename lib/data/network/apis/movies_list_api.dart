import 'package:flutter_api_mvvm/data/model/movies.dart';
import 'package:flutter_api_mvvm/utils/constants/constant_fields.dart';

import 'api_services/base_api_service.dart';
import 'api_services/network_api_service.dart';

class MoviesListAPI {
  final BaseAPIServices _apiServices = NetworkAPIServices();
  Future<MovieList> getMovies() async {
    dynamic result = await _apiServices.getAPIResponse(moviesListEndPoint);
    return MovieList.fromJson(result);
  }
}
