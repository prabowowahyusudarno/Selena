

import 'config.dart';

class UrlData {
  static String authLogin = getAuthUrl();
  static String baseUrl = getBaseUrl();
  static String baseKey = getBaseKey();

  static String getBaseUrl() {
    if (AppConfig.env == Env.production) {
      return "https://dev-api.selenago.com/api/v1";
    }
    if (AppConfig.env == Env.stagging) {
      return "https://dev-api.selenago.com/api/v1";
    }
    if (AppConfig.env == Env.development) {
      return "https://dev-api.selenago.com/api/v1";
    } else {
      return "https://dev-api.selenago.com/api/v1";
    }
  }

  static String getAuthUrl() {
    if (AppConfig.env == Env.production) {
      return "https://dev-api.selenago.com/api/v1";
    }
    if (AppConfig.env == Env.stagging) {
      return "https://dev-api.selenago.com/api/v1";
    }
    if (AppConfig.env == Env.development) {
      return "https://dev-api.selenago.com/api/v1";
    } else {
      return "https://dev-api.selenago.com/api/v1";
    }
  }

  static String getBaseKey() {
    if (AppConfig.env == Env.production) {
      return "";
    }
    if (AppConfig.env == Env.stagging) {
      return "";
    }
    if (AppConfig.env == Env.development) {
      return "";
    } else {
      return "";
    }
  }
}
