import 'package:flutter_api_mvvm/exceptions/app_exceptions.dart';

class FetchDataException extends AppException {
  FetchDataException({required String message})
      : super(
          message: message,
          prefix: 'Error During Communication',
        );
}

class BadRequestException extends AppException {
  BadRequestException({required String message})
      : super(
          message: message,
          prefix: 'Invalid Request',
        );
}

class UnAuthorizedException extends AppException {
  UnAuthorizedException({required String message})
      : super(
          message: message,
          prefix: 'Invalid Request',
        );
}

class InvalidInputException extends AppException {
  InvalidInputException({required String message})
      : super(
          message: message,
          prefix: 'Invalid Request',
        );
}
