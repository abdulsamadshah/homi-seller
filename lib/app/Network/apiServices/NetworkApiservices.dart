import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../Response/Apiexception.dart';
import 'Baseapiservices.dart';

class NetworkapiServices extends Baseapiservices {
  @override
  Future GetapiServices(String url) async {
    try {
      final responsejson;
      dynamic response =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      return responsejson = returnresponse(response);
    } catch (e) {
      throw e;
    }
    // return responsejson;
  }


  @override
  Future PostapiServices(String url, data) async {
    try {
      Map<String, String> headers = {"Accept": "application/json",};
      // Map<String, String> headers = {"Content-type": "application/json","Accept": "application/json",};
      dynamic responsejson;
      dynamic response = await http
          .post(Uri.parse(url), body: data,headers:headers)
          .timeout(Duration(seconds: 10));
      print("rightnetworkres");
      return responsejson = returnresponse(response);

    } catch (e) {
      print("wrongnetworkres");
      throw e;
    }
  }

  dynamic returnresponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responsedata = jsonDecode(response.body);
        print("thisworking200");
        return responsedata;

      case 401:
        print("thisworking401");
        throw UserauthorizedException("Userauthorized Request");

      case 400:
        print("thisworking400");
        throw UserauthorizedException("Userauthorized Request");

      case 404:
        print("thisworking404");
        throw UserauthorizedException("Not found data");

      case 422:
        print("thisworking422");
        throw UserauthorizedException("Invalid Data");

      case 500:
        print("thisworking500");
        throw InavalidInputException("Invalid Request");

      case 501:
        print("thisworking501");
        throw InavalidInputException("Bad Gateway");

      case 503:
        print("thisworking503");
        throw BadrequestDataexception("Bade Request");

      default:
        print("thisworkingdefault");
        throw Fetchdataexception("Error During communication");
    }
  }
}
