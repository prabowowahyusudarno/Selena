// To parse this JSON data, do
//
//     final errorExceptionResponse = errorExceptionResponseFromJson(jsonString);

import 'dart:convert';

ErrorExceptionResponse errorExceptionResponseFromJson(String str) =>
    ErrorExceptionResponse.fromJson(json.decode(str));

String errorExceptionResponseToJson(ErrorExceptionResponse data) =>
    json.encode(data.toJson());

class ErrorExceptionResponse {
  String message;
  String exceptionMessage;
  String exceptionType;
  String stackTrace;

  ErrorExceptionResponse({
    this.message,
    this.exceptionMessage,
    this.exceptionType,
    this.stackTrace,
  });

  factory ErrorExceptionResponse.fromJson(Map<String, dynamic> json) =>
      new ErrorExceptionResponse(
        message: json["Message"] == null ? null : json["Message"],
        exceptionMessage:
            json["ExceptionMessage"] == null ? null : json["ExceptionMessage"],
        exceptionType:
            json["ExceptionType"] == null ? null : json["ExceptionType"],
        stackTrace: json["StackTrace"] == null ? null : json["StackTrace"],
      );

  Map<String, dynamic> toJson() => {
        "Message": message == null ? null : message,
        "ExceptionMessage": exceptionMessage == null ? null : exceptionMessage,
        "ExceptionType": exceptionType == null ? null : exceptionType,
        "StackTrace": stackTrace == null ? null : stackTrace,
      };
}
