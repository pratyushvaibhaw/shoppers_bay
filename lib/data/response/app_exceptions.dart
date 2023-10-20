//parent class for exceptions
class AppException implements Exception {
  final _message;
  final _prefix;
  AppException(this._message, this._prefix);

  String toString() {
    return '$_prefix $_message';
  }
}

//in case of  server delay
class FetchDataExceptions extends AppException {
  FetchDataExceptions(String? message)
      : super(message, 'error during communication');
}
//in case of incomplete information by the user

class BadRequestExceptions extends AppException {
  BadRequestExceptions(String? message) : super(message, ' Invalid request ');
}

//in case of wrong api key
class UnauthorisedExceptions extends AppException {
  UnauthorisedExceptions(String? message)
      : super(message, ' Unauthorised request ');
}

//wrong input by the user
class InvalidIinputExceptions extends AppException {
  InvalidIinputExceptions(String? message) : super(message, ' Invalid input ');
}
