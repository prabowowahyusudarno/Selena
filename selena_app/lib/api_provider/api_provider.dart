import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:selena_app/model/error_response.dart';
import 'package:selena_app/model/response/DataResponse.dart';
import 'package:selena_app/model/response/DetailDataResponse.dart';
import 'package:selena_app/util/url_data.dart';

import 'network_helper.dart';
import 'network_module.dart';

class ApiProvider {
//  Client client = HttpClientWithInterceptor.build(interceptors: [
//    ApiInterceptor(),
//  ], requestTimeout: Duration(seconds: 30));

  Future<DataResponse> getData() async {
    try {
      NetworkModule networkModule = NetworkModule();
      final response = await networkModule.requestGet(
          "${UrlData.baseUrl}/activity");

      DataResponse dataResponse =
      DataResponse.fromJson(json.decode(response.body));
      return dataResponse;
    } on Exception catch (error) {
      throw FormatException(error.toString());
    }
  }

  Future<DetailDataResponse> getDetailData(String slug) async {
    try {
      NetworkModule networkModule = NetworkModule();
      final response = await networkModule.requestGet(
          "${UrlData.baseUrl}/activity/$slug");

      DetailDataResponse attachmentResponse =
      DetailDataResponse.fromJson(json.decode(response.body));
      return attachmentResponse;
    } on Exception catch (error) {
      throw FormatException(error.toString());
    }
  }

}
