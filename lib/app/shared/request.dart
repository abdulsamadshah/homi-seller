import 'package:dio/dio.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:shared_preferences/shared_preferences.dart';
import 'constants.dart';


class Request {
  Future<Dio> getApiClient(bool isPublic) async {
    Dio dio =  Dio(Constants.networkOptions);
    dio.interceptors.clear();
    final prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
  
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      if (!isPublic) {
        options.headers["Authorization"] = "Bearer ${token!}";
      }
      return handler.next(options);
    }, onResponse: (response, handler) {
      return handler.next(response);
    }, onError: (error, handler) {
      return handler.next(error);
    }));
    return dio;
  }
}