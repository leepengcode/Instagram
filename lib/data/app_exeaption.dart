class AppExeaption implements Exception {
  late final _message;
  late final _profix;
  AppExeaption([this._message, this._profix]);

  String toString() {
    return '$_profix$_message';
  }
}

class FetchDataException extends AppExeaption {
  FetchDataException([String? message])
      : super(message, 'Error During Communication');
}

class BadRequestException extends AppExeaption {
  BadRequestException([String? message]) : super(message, 'Invalid request');
}

class UnaThorisedException extends AppExeaption {
  UnaThorisedException([String? message])
      : super(message, 'Unathorised request');
}
