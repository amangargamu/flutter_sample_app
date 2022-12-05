// ignore_for_file: unnecessary_type_check

import 'package:dio/dio.dart';
import 'package:grappus_mobile/data/network/api/endpoints.dart';
import 'package:grappus_mobile/data/network/api/error/error_response.dart';

const errorGeneral = 'Something went wrong. Please try again!';
const errorRequestTimeOut =
    'Unable to connect to server. Kindly check your internet connection!';

ErrorResponse handleError(DioError error) {
  var errorDescription = '';
  int? customErrorCode;
  switch (error.type) {
    case DioErrorType.cancel:
      errorDescription = 'Request to API server was cancelled';
      break;
    case DioErrorType.response:
      if (error.response != null && error.response?.data != null) {
        try {
          if (error.response?.statusCode == 401) {
            errorDescription = 'Session Expired. Please login again!';
            customErrorCode = KApiResponseCodes.statusMalformed;
          } else if (error.response?.data is Map<String, dynamic>) {
            final customError = ErrorResponse.fromJson(error.response?.data);
            errorDescription = customError.message ?? '';
            customErrorCode = customError.customErrorCode;
          } else {
            if (errorDescription.isEmpty) errorDescription = errorGeneral;
          }
        } on Exception {
          errorDescription = errorGeneral;
        }
      }
      if (errorDescription.isEmpty) errorDescription = errorGeneral;
      break;
    case DioErrorType.connectTimeout:
      errorDescription = 'CONNECT_TIMEOUT : ${error.message}';
      break;
    case DioErrorType.receiveTimeout:
      errorDescription = 'RECEIVE_TIMEOUT : ${error.message}';
      break;
    case DioErrorType.sendTimeout:
      errorDescription = 'SEND_TIMEOUT : ${error.message}';
      break;
    case DioErrorType.other:
      if (error.message.contains('SocketException')) {
        errorDescription = 'No Internet Connection!';
        break;
      }
      errorDescription = errorRequestTimeOut;
      break;
  }
  final errorResponse = ErrorResponse(
    customErrorCode:
        customErrorCode ?? KApiResponseCodes.statusServiceUnavailable,
    message: errorDescription,
  );
  return errorResponse;
}
