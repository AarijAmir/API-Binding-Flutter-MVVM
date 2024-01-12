import 'package:flutter_api_mvvm/data/network/responses/status.dart';

class NetworkResponse<T> {
  Status? status;
  T? data;
  String? message;
  NetworkResponse(
      {required this.data, required this.message, required this.status});
  NetworkResponse.loading() : status = Status.loading;
  NetworkResponse.error(this.message) : status = Status.error;
  NetworkResponse.completed(this.data) : status = Status.completed;
  @override
  String toString() {
    // TODO: implement toString
    return 'Status: $status, \n Message: $message, \n Data: $data';
  }
}
