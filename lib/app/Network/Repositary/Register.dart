import 'package:get/get_connect/http/src/response/response.dart';
import 'package:homlisellerapp/app/Network/apiServices/Baseapiservices.dart';

import '../apiServices/NetworkApiservices.dart';
import '../apiServices/apiurl.dart';

class Registerrepo {
  Baseapiservices _baseapiservices = NetworkapiServices();

  Future<dynamic> Sendotprepo(dynamic data) async {
    final response =
        await _baseapiservices.PostapiServices(Apiurl.SendOtpurl, data);
    return response;
  }

  Future<dynamic> Registerationrep(dynamic data) async {
    final response =
        await _baseapiservices.PostapiServices(Apiurl.Signupurl, data);
    return response;
  }

  Future<dynamic> loginotp(dynamic data) async {
    final response =
        await _baseapiservices.PostapiServices(Apiurl.sellerloginotp, data);
    return response;
  }

  Future<dynamic> loginautmains(dynamic data) async {
    final response =
        await _baseapiservices.PostapiServices(Apiurl.Loginurl, data);
    return response;
  }


  Future<dynamic> sellerpersonaldetails(dynamic data) async {
    final response =
    await _baseapiservices.PostapiServices(Apiurl.Personaldataurl, data);
    return response;
  }

  Future<dynamic> sellerShopdetails(dynamic data) async {
    final response =
    await _baseapiservices.PostapiServices(Apiurl.Companydataurl, data);
    return response;
  }

}
