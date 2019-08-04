// To parse this JSON data, do
//
//     final errorResponse = errorResponseFromJson(jsonString);

import 'dart:convert';

ErrorResponse errorResponseFromJson(String str) =>
    ErrorResponse.fromJson(json.decode(str));

String errorResponseToJson(ErrorResponse data) => json.encode(data.toJson());

class ErrorResponse {
  String errorDescription;
  String error;

  ErrorResponse({
    this.errorDescription,
    this.error,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) =>
      new ErrorResponse(
        errorDescription: json["error_description"] == null
            ? null
            : json["error_description"],
        error: json["error"] == null ? null : json["error"],
      );

  Map<String, dynamic> toJson() => {
        "error_description": errorDescription == null ? null : errorDescription,
        "error": error == null ? null : error,
      };
}
