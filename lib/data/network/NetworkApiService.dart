import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../AppExceptions.dart';
import 'BaseApiServices.dart';

class NetworkApiService extends BaseApiService {
  @override
  Future getGetApiResponse(String url, dynamic queryParams) async {
    dynamic responseJson;
    try {
      final Uri uri = Uri.parse(url).replace(queryParameters: queryParams);
      if (kDebugMode) {
        print(uri.toString());
      }
      final response = await http.get(uri).timeout(const Duration(seconds: 60));
      responseJson = returnResponse(response);
      if (kDebugMode) {
        print(responseJson);
      }
    } on SocketException {
      throw FetchDataException("No Internet connection, please connect to internet and retry again.");
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    if (kDebugMode) {
      print(url);
      print(data);
    }
    dynamic responseJson;
    try {
      Response response = await post(Uri.parse(url), body: data).timeout(const Duration(seconds: 60));
      responseJson = returnResponse(response);
      if (kDebugMode) {
        print(responseJson);
      }
    } on SocketException {
      throw FetchDataException("No Internet connection, please connect to internet and retry again.");
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw InvalidUrlException(response.body.toString());
      case 500:
      case 404:
        throw UnauthorisedException(response.body.toString());
      default:
        throw FetchDataException("Error occured while communicating with server" + "with Status Code" + response.statusCode.toString());
    }
  }
}
