import 'dart:convert';

ErrorResponse errorResponseFromJson(String str) =>
    ErrorResponse.fromJson(json.decode(str));

String errorResponseToJson(ErrorResponse data) => json.encode(data.toJson());

class ErrorResponse {
  ErrorResponse({
    this.customErrorCode,
    this.stack,
    this.message,
    this.success,
    this.requestID,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => ErrorResponse(
        customErrorCode: json['customErrorCode'],
        message: json['message'],
        stack: json['stack'],
        requestID: json['requestID'],
        success: json['success'],
      );

  Map<String, dynamic> toJson() => {
        'customErrorCode': customErrorCode,
        'message': message,
        'stack': stack,
        'requestID': requestID,
        'success': success,
      };

  int? customErrorCode;
  String? stack;
  String? message;
  bool? success;
  String? requestID;
}
