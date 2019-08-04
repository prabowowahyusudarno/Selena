class NetworkHelper {
  /**
   * HTTP Status-Code 200: OK.
   */
  static final int HTTP_OK = 200;

  /**
   * HTTP Status-Code 201: Created.
   */
  static final int HTTP_CREATED = 201;

  /**
   * HTTP Status-Code 202: Accepted.
   */
  static final int HTTP_ACCEPTED = 202;

  /**
   * HTTP Status-Code 203: Non-Authoritative Information.
   */
  static final int HTTP_NOT_AUTHORITATIVE = 203;

  /**
   * HTTP Status-Code 204: No Content.
   */
  static final int HTTP_NO_CONTENT = 204;

  /**
   * HTTP Status-Code 205: Reset Content.
   */
  static final int HTTP_RESET = 205;

  /**
   * HTTP Status-Code 206: Partial Content.
   */
  static final int HTTP_PARTIAL = 206;

  /* 3XX: relocation/redirect */

  /**
   * HTTP Status-Code 300: Multiple Choices.
   */
  static final int HTTP_MULT_CHOICE = 300;

  /**
   * HTTP Status-Code 301: Moved Permanently.
   */
  static final int HTTP_MOVED_PERM = 301;

  /**
   * HTTP Status-Code 302: Temporary Redirect.
   */
  static final int HTTP_MOVED_TEMP = 302;

  /**
   * HTTP Status-Code 303: See Other.
   */
  static final int HTTP_SEE_OTHER = 303;

  /**
   * HTTP Status-Code 304: Not Modified.
   */
  static final int HTTP_NOT_MODIFIED = 304;

  /**
   * HTTP Status-Code 305: Use Proxy.
   */
  static final int HTTP_USE_PROXY = 305;

  /* 4XX: client error */

  /**
   * HTTP Status-Code 400: Bad Request.
   */
  static final int HTTP_BAD_REQUEST = 400;

  /**
   * HTTP Status-Code 401: Unauthorized.
   */
  static final int HTTP_UNAUTHORIZED = 401;

  /**
   * HTTP Status-Code 402: Payment Required.
   */
  static final int HTTP_PAYMENT_REQUIRED = 402;

  /**
   * HTTP Status-Code 403: Forbidden.
   */
  static final int HTTP_FORBIDDEN = 403;

  /**
   * HTTP Status-Code 404: Not Found.
   */
  static final int HTTP_NOT_FOUND = 404;

  /**
   * HTTP Status-Code 405: Method Not Allowed.
   */
  static final int HTTP_BAD_METHOD = 405;

  /**
   * HTTP Status-Code 406: Not Acceptable.
   */
  static final int HTTP_NOT_ACCEPTABLE = 406;

  /**
   * HTTP Status-Code 407: Proxy Authentication Required.
   */
  static final int HTTP_PROXY_AUTH = 407;

  /**
   * HTTP Status-Code 408: Request Time-Out.
   */
  static final int HTTP_CLIENT_TIMEOUT = 408;

  /**
   * HTTP Status-Code 409: Conflict.
   */
  static final int HTTP_CONFLICT = 409;

  /**
   * HTTP Status-Code 410: Gone.
   */
  static final int HTTP_GONE = 410;

  /**
   * HTTP Status-Code 411: Length Required.
   */
  static final int HTTP_LENGTH_REQUIRED = 411;

  /**
   * HTTP Status-Code 412: Precondition Failed.
   */
  static final int HTTP_PRECON_FAILED = 412;

  /**
   * HTTP Status-Code 413: Request Entity Too Large.
   */
  static final int HTTP_ENTITY_TOO_LARGE = 413;

  /**
   * HTTP Status-Code 414: Request-URI Too Large.
   */
  static final int HTTP_REQ_TOO_LONG = 414;

  /**
   * HTTP Status-Code 415: Unsupported Media Type.
   */
  static final int HTTP_UNSUPPORTED_TYPE = 415;

  /* 5XX: server error */

  /**
   * HTTP Status-Code 500: Internal Server Error.
   * @deprecated   it is misplaced and shouldn't have existed.
   */
  static final int HTTP_SERVER_ERROR = 500;

  /**
   * HTTP Status-Code 500: Internal Server Error.
   */
  static final int HTTP_INTERNAL_ERROR = 500;

  /**
   * HTTP Status-Code 501: Not Implemented.
   */
  static final int HTTP_NOT_IMPLEMENTED = 501;

  /**
   * HTTP Status-Code 502: Bad Gateway.
   */
  static final int HTTP_BAD_GATEWAY = 502;

  /**
   * HTTP Status-Code 503: Service Unavailable.
   */
  static final int HTTP_UNAVAILABLE = 503;

  /**
   * HTTP Status-Code 504: Gateway Timeout.
   */
  static final int HTTP_GATEWAY_TIMEOUT = 504;

  /**
   * HTTP Status-Code 505: HTTP Version Not Supported.
   */
  static final int HTTP_VERSION = 505;

  static String getHttpMessage(int statusCode) {
    String message = "";

    if (statusCode == HTTP_UNAUTHORIZED) {
      message =
          "Unauthorized,\nAuthentication is required and has failed or has not yet been provided.";
    } else if (statusCode == HTTP_FORBIDDEN) {
      message =
          "Forbidden,\nThe request was a valid request, but the server is refusing to respond to it.";
    } else if (statusCode == HTTP_NOT_FOUND) {
      message =
          "End Point Not Found,\nThe requested resource could not be found but may be available again in the future.";
    } else if (statusCode == HTTP_BAD_METHOD) {
      message =
          "Method not allowed,\nA request was made of a resource using a request method not supported by that resource.";
    } else if (statusCode == HTTP_NOT_ACCEPTABLE) {
      message =
          "Not Acceptable,\nThe requested resource is only capable of generating content not acceptable\naccording to the Accept headers sent in the request.";
    } else if (statusCode == HTTP_PROXY_AUTH) {
      message =
          "Proxy Authentication Required,\nThe client must first authenticate itself with the proxy.";
    } else if (statusCode == HTTP_CLIENT_TIMEOUT) {
      message =
          "Request Timeout,\nThe server timed out waiting for the request.";
    } else if (statusCode == HTTP_CONFLICT) {
      message =
          "Conflict,\nIndicates that the request could not be processed because of conflict in the request,\nsuch as an edit conflict in the case of multiple updates.";
    } else if (statusCode == HTTP_GONE) {
      message =
          "Gone,\nIndicates that the resource requested is no longer available and will not be available again.";
    } else if (statusCode == HTTP_LENGTH_REQUIRED) {
      message =
          "Length Required,\nThe request did not specify the length of its content, which is required by the requested resource.";
    } else if (statusCode == HTTP_PRECON_FAILED) {
      message =
          "Precondition Failed,\nThe server does not meet one of the preconditions that the requester put on the request.";
    } else if (statusCode == HTTP_ENTITY_TOO_LARGE) {
      message =
          "Request Entity Too Large,\nThe request is larger than the server is willing or able to process.";
    } else if (statusCode == HTTP_REQ_TOO_LONG) {
      message =
          "Request-URI Too Long,\nThe URI provided was too long for the server to process.";
    } else if (statusCode == HTTP_UNSUPPORTED_TYPE) {
      message =
          "Unsupported Media Type,\nThe request entity has a media type which the server or resource does not support.";
    } else if (statusCode == HTTP_INTERNAL_ERROR) {
      message = "Internal Server Error,\n" +
          "A generic error message,\n" +
          "given when an unexpected condition was encountered and no more specific message is suitable.";
    } else if (statusCode == HTTP_NOT_IMPLEMENTED) {
      message =
          "Not Implemented,\nThe server either does not recognize the request method, or it lacks the ability to fulfill the request.";
    } else if (statusCode == HTTP_BAD_GATEWAY) {
      message =
          "Bad Gateway,\nThe server was acting as a gateway or proxy and received an invalid response from the upstream server.";
    } else if (statusCode == HTTP_UNAVAILABLE) {
      message =
          "Service Unavailable,\nThe server is currently unavailable (because it is overloaded or down for maintenance).";
    } else if (statusCode == HTTP_GATEWAY_TIMEOUT) {
      message =
          "Gateway Timeout,\nThe server was acting as a gateway or proxy and did not receive a timely response from the upstream server.";
    } else if (statusCode == HTTP_VERSION) {
      message =
          "Http version not supported,\nThe server does not support the HTTP protocol version used in the request.";
    } else {
      message = "Error Other";
    }
    return message;
  }
}
