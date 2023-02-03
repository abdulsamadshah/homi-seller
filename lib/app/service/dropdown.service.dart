import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Network/apiServices/apiurl.dart';
import '../model/AddproductMainCategory.dart';
import '../shared/utility.dart';
import 'package:http/http.dart' as http;

class Dropdownservice {

  Future<List> getmainCategory() async {

    Dio dio = new Dio();
        final prefs = await SharedPreferences.getInstance();
        var token = prefs.getString('token');
        print("Tokens${token}");
        dio.options.headers["authorization"] = "Bearer ${token}";
        dio.options.headers['accept'] = 'application/json';
    Response response =
        await dio.get(Apiurl.addproductCateogyurl,);;
    List list = Utility.isNullEmptyOrFalse(response.data['data'])
        ? []
        : response.data['data'];
    return list;
  }


  Future<List> getSubCategory() async {
    SharedPreferences preferences =await SharedPreferences.getInstance();
    String? maincategoryid=preferences.getString("maincategoryId");
    print("maincategoryId:"+maincategoryid.toString());
    Map data = {
      'id': maincategoryid,
    };
    Dio dio = new Dio();
        final prefs = await SharedPreferences.getInstance();
        var token = prefs.getString('token');
        print("Tokens${token}");
        dio.options.headers["authorization"] = "Bearer ${token}";
        dio.options.headers['accept'] = 'application/json';
    Response response = await dio.post(Apiurl.addproductSubCategoryurl,data:data);
    List list = Utility.isNullEmptyOrFalse(response.data['subCategory'])
        ? []
        : response.data['subCategory'];
    return list;
  }












  /*
  Future<List> getaddmaincategory() async {

        // dio.options.headers["authorization"] = "Bearer ${token!}";
        // dio.options.headers['accept'] = 'application/json';

    var url = Uri.parse(Apiurl.addproductCateogyurl);
    http.Response response = await http.get(url,headers:headers);

    var data1 = json.decode(response.body);

    List list =data1['data'];

    return list;
  }

   */

  Future<List> getStatemain() async {
    Dio dio = new Dio();
    Response response =
    await dio.post("http://homliadmin.globusachievers.com/api/get-state");
    List list = Utility.isNullEmptyOrFalse(response.data['data'])
        ? []
        : response.data['data'];
    return list;
  }




  Future<List> getStatedata() async {
    SharedPreferences preferences =await SharedPreferences.getInstance();
    String? stateid=preferences.getString("StateId");
    print("Stateids:"+stateid.toString());
    Map data = {
      'id': stateid,
    };
    Dio dio = new Dio();
    Response response =
    await dio.post("http://homliadmin.globusachievers.com/api/get-city",data: data);
    List list = Utility.isNullEmptyOrFalse(response.data['data'])
        ? []
        : response.data['data'];
    return list;
  }



  Future<List> getDistrictData() async {
    SharedPreferences preferences =await SharedPreferences.getInstance();
    String? CityId=preferences.getString("CityId");
    print("Stateids:"+CityId.toString());
    Map data = {
      'id': CityId,
    };
    Dio dio = new Dio();
    Response response =
    await dio.post("http://homliadmin.globusachievers.com/api/get-district",data: CityId);
    List list = Utility.isNullEmptyOrFalse(response.data['data'])
        ? []
        : response.data['data'];
    return list;
  }







  // Future<List> getNoOfShift(String time) async {
  //   Dio dio = new Dio();
  //   Response response = await dio.get(
  //       "https://fgproduction.saamaancart.com/api/get-shift?start_time=$time");
  //   List list = Utility.isNullEmptyOrFalse(response.data) ? [] : response.data;
  //   return list;
  // }
  //
  // getModelById(dynamic id) async {
  //   Dio dio = new Dio();
  //   Response response = await dio.get(
  //       "https://fgproduction.saamaancart.com/api/category-by-id?category_id=$id");
  //   dynamic list = Utility.isNullEmptyOrFalse(response.data['category_data'])
  //       ? []
  //       : response.data['category_data'];
  //   return list;
  // }
  //
  // // getLabourByJobId(dynamic data) async{
  // Future<List> getLabourByJobId(dynamic data) async {
  //   try {
  //     Dio dio = new Dio();
  //     final prefs = await SharedPreferences.getInstance();
  //     var token = prefs.getString('token');
  //     dio.options.headers["authorization"] = "Bearer ${token!}";
  //     dio.options.headers['accept'] = 'application/json';
  //
  //     Response response = await dio.post(
  //         "https://fgproduction.saamaancart.com/api/job/assigned-labour",
  //         data: data);
  //     dynamic list = Utility.isNullEmptyOrFalse(response.data['users'])
  //         ? []
  //         : response.data['users'];
  //     return list;
  //   } catch (e) {
  //     return [];
  //   }
  // }

  
}
