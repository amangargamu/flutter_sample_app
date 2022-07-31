class Endpoints {
  Endpoints._();

  // base url
  static const String baseUrl = 'https://reqres.in/api';

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 15000;

  static const String users = '/users';
}

class KApiResponseCodes {
  static const int statusUnauthorisedAccess = 401;
  static const int statusServiceUnavailable = 503;
  static const int statusForbidden = 403;
  static const int statusMalformed = 401;
  static const int statusRequestTimeOut = 408;
  static const int statusNotFound = 404;
}
