import 'package:dio/dio.dart';

class Constants {
  static String baseUrl = '';

  static BaseOptions networkOptions = BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: 150000,
    receiveTimeout: 100000,
  );
 
}
