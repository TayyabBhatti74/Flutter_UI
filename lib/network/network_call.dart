import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:async';

class NetworkCall{
  static Future<ApiResponse> getApiCall(String url) async {
    if (kDebugMode) {
      print("ApiUrl $url");
    }
    try {
      var response = await http.get(Uri.parse(url));
      return _checkResponse(response);
    } on SocketException {
      return ApiResponse(
          done: false,
          errorMsg: "Please check your connection",
          responseString: null);
    }
  }

  static ApiResponse _checkResponse(http.Response response) {
    switch (response.statusCode) {
      case 201:
        return ApiResponse(
            done: true, errorMsg: null, responseString: response.body);
      case 200:
        return ApiResponse(
            done: true, errorMsg: null, responseString: response.body);
      case 400:
        return ApiResponse(
            done: true, errorMsg: "Bad Request", responseString: response.body);
      case 401:
        return ApiResponse(
            done: false, errorMsg: null, responseString: response.body);
      case 403:
        return ApiResponse(
            done: false, errorMsg: "Unauthorized Request", responseString: null);
      case 404:
        return ApiResponse(
            done: true, errorMsg: "Page not Found", responseString: response.body);
      case 500:
        return ApiResponse(
            done: false, errorMsg: "Server Error", responseString: null);
      default:
        return ApiResponse(
            done: false,
            errorMsg: "Error occurred while Communication with or timeout",
            responseString: null);
    }
  }

}

class ApiResponse {
  String? responseString;
  String? errorMsg;
  bool? done;

  ApiResponse({this.done, this.errorMsg, this.responseString});
}