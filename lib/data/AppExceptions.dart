class AppExceptions implements Exception {
  final _message;
  final _prefix;

  AppExceptions([this._message, this._prefix]);

  String toString() {
    return "$_prefix\n$_message";
  }
}

class InternetException extends AppExceptions {
  InternetException([String? message]) : super(message, "No Internet");
}

class RequestTimeoutException extends AppExceptions {
  RequestTimeoutException([String? message]) : super(message, "Request time out");
}

class ServerException extends AppExceptions {
  ServerException([String? message]) : super(message, "Internal server error.");
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? message]) : super(message, "Error during communication.");
}

class BadRequestException extends AppExceptions {
  BadRequestException([String? message]) : super(message, "Bad request, invalid request");
}

class UnauthorisedException extends AppExceptions {
  UnauthorisedException([String? message]) : super(message, "Unauthorised request");
}

class InvalidInputException extends AppExceptions {
  InvalidInputException([String? message]) : super(message, "Invalid input");
}

class InvalidUrlException extends AppExceptions {
  InvalidUrlException([String? message]) : super(message, "Invalid Url");
}
