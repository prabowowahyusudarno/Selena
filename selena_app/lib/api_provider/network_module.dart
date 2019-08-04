import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:http/io_client.dart';
import 'package:selena_app/model/error_exception_response.dart';
import 'package:selena_app/util/Constants.dart';
import 'package:selena_app/util/shared_preferences_helper.dart';
import 'package:selena_app/util/url_data.dart';

import 'network_helper.dart';

class NetworkModule {
  HttpClient httpClient;
  IOClient ioClient;

  NetworkModule() {
    httpClient = HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) {
        // tests that cert is self signed, correct subject and correct date(s)
        return (cert.issuer == cert.subject &&
            cert.subject == "+V/2espvUvUrHOqTnQderjpv2FbkVji+vezMpTkezAY=" &&
            cert.endValidity.millisecondsSinceEpoch == 1234567890);
      });
    httpClient.connectionTimeout = const Duration(seconds: 30);
    ioClient = IOClient(httpClient);
  }

  Future<Response> requestPost(String url, String body,
      {bool isBodyEncode = false}) async {
    final response = await ioClient.post(url,
        body: body,
        headers: await getHeaders(url));
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == NetworkHelper.HTTP_OK) {
      return response;
    } else if (response.statusCode == NetworkHelper.HTTP_INTERNAL_ERROR) {
      final ErrorExceptionResponse err =
          ErrorExceptionResponse.fromJson(json.decode(response.body));
      throw FormatException(err.message);
    } else if (response.statusCode == NetworkHelper.HTTP_BAD_REQUEST) {
      return response;
    } else {
      throw FormatException(NetworkHelper.getHttpMessage(response.statusCode));
    }
  }

  Future<Response> requestGet(String url) async {
    final response = await ioClient.get(url, headers: await getHeaders(url));
    if (response.statusCode == NetworkHelper.HTTP_OK) {
      return response;
    } else if (response.statusCode == NetworkHelper.HTTP_INTERNAL_ERROR) {
      final ErrorExceptionResponse err =
          ErrorExceptionResponse.fromJson(json.decode(response.body));
      throw FormatException(err.message);
    } else {
      throw FormatException(NetworkHelper.getHttpMessage(response.statusCode));
    }
  }

  Future<Map<String, dynamic>> getHeaders(String url) async {
    if (url.contains(UrlData.authLogin)) {
      final Map<String, String> headers = {
        "Accept": "application/json",
        "Authorization":
            "Basic aGFXZG5sc2FEcUhmSWhGajBDMHhvNnJvV2hrYTowc3RkSnpNMGJLakFmZHVPN050WTRHSmJseVFh",
      };
      return headers;
    } else if (url.contains(UrlData.baseUrl)) {
      final Map<String, String> headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization":
            "Bearer ${await SharedPreferencesHelper.getString(Constants.accessToken)}"
      };
      return headers;
    }
  }
}
