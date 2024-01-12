import 'dart:convert';
import 'dart:io';

import 'package:flutter_api_mvvm/exceptions/network_exceptions/network_exceptions.dart';
import 'package:http/http.dart' as http;

import 'base_api_service.dart';

class NetworkAPIServices extends BaseAPIServices {
  @override
  Future getAPIResponse(String url) async {
    // TODO: implement getAPIResponse
    try {
      http.Response response = await http.get(Uri.parse(url)).timeout(
            const Duration(
              seconds: 10,
            ),
          );
      if (response.isSuccessOrFailure()) {
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      }
    } on SocketException {
      throw FetchDataException(message: 'No Internet Connection');
    }
  }

  @override
  Future postAPIResponse(String url, dynamic data) async {
    // TODO: implement postAPIResponse
    try {
      http.Response response = await http
          .post(Uri.parse(url), body: data)
          .timeout(
            const Duration(
              seconds: 10,
            ),
          )
          .timeout(const Duration(seconds: 10));
      if (response.isSuccessOrFailure()) {
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      }
    } on SocketException {
      throw FetchDataException(message: 'No Internet Connection');
    }
  }
}

extension on http.Response {
  bool isSuccessOrFailure() {
    switch (statusCode) {
      case 200:
        return true;
      case 400:
        throw BadRequestException(message: body);
      case 500:
      case 404:
        throw UnAuthorizedException(message: body);
      default:
        throw FetchDataException(
            message:
                'Error occurred while communicating with server with status code: $statusCode');
    }
  }
}
