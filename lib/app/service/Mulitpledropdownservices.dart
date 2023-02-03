


import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../Network/apiServices/apiurl.dart';
import '../model/Category.dart';
import '../model/Cuisine_model.dart';
import '../model/SubSubCategory_model.dart';
import '../model/StateData_model.dart';
import 'package:http/http.dart' as http;
class Muiltidropdown{


  List<Category> subjectData = [];
  Future<List<Category>> getstatedata() async {
    subjectData.clear();


    List<Category> tempSubjectData = [];
    // List<StateData> list;

    var url = Uri.parse("http://homliadmin.globusachievers.com/api/get-state");
    http.Response response = await http.post(url,);

    // print("Response" + response.body);
    var data1 = json.decode(response.body);

    // var rest = data1["data"] as List<dynamic>;

    List list =data1['data'];

    // print(" api datas" + rest.toString());

    // list = rest.map<StateData>((json) => StateData.fromJson(json)).toList();
    try {
      // int index=0;
      list.forEach((element) {
        tempSubjectData.add(Category.fromJson(element));
        // print("Each Response" + datas['id'].toString());
        // print("Each Response" + datas['name'].toString());
        // tempSubjectData.add(Category(
        //     id: datas['id'].toString(), name: datas['name'].toString()));
      });
    } catch (e) {
      print("Some issue:${e.toString()}");
    }

    try {
      // print(tempSubjectData.toString());
      subjectData.addAll(tempSubjectData);
    } catch (es) {
      print("here is issue");
    }


    return tempSubjectData;
  }



  //
  var token;
  List<SubSubCategory> subsubcategorydata = [];
  Future<List<SubSubCategory>> getSubSubCategorydata() async {
    // print(object)
    subsubcategorydata.clear();
    final prefs = await SharedPreferences.getInstance();
     token = prefs.getString('token');
    print("Tokens${token}");

    String? subscategoryid=prefs.getString("subcategoryId");
    print("subcategoryId:"+subscategoryid.toString());
    Map data = {
      'id': subscategoryid,
    };

    List<SubSubCategory> tempSubSubCategoryData = [];
    var headersdata = {
      'authorization':'Bearer $token'
    };
    print("responseTokens:${token}");

    var url = Uri.parse("http://homliadmin.globusachievers.com/api/get-parent-category-without-attribute");
    http.Response response = await http.post(url,body:data,headers:headersdata);
    print("Body REsponse"+response.body);

    print("REsponse Code"+response.statusCode.toString());
    var subcategorydata = json.decode(response.body);
    List list =subcategorydata['data'];

    try {
      // int index=0;
      list.forEach((element) {
        tempSubSubCategoryData.add(SubSubCategory.fromJson(element));

      });
    } catch (e) {
      print("Something wrongdata${e.toString()}");
    }

    try {
      subsubcategorydata.addAll(tempSubSubCategoryData);
    } catch (e) {
      print("Something wrong${e.toString()}");
    }

    return tempSubSubCategoryData;
  }




 //Cuisine
  var cuisinetoken;
  List<Cuisine> cuisinesubsubcategorydata = [];
  Future<List<Cuisine>> getcuisineCategorydata() async {
    // print(object)
    cuisinesubsubcategorydata.clear();
    final prefs = await SharedPreferences.getInstance();

    String? subsubscategoryid=prefs.getString("subcategoryId");
    print("subcategoryId:"+subsubscategoryid.toString());
    Map data = {
      'id': subsubscategoryid,
    };

    List<Cuisine> tempcuisineCategoryData = [];
    var headersdata = {
      'authorization':'Bearer $cuisinetoken'
    };
    print("responseTokens:${cuisinetoken}");

    var url = Uri.parse("http://homliadmin.globusachievers.com/api/get-parent-category");
    http.Response response = await http.post(url,body:data,headers:headersdata);
    print("Body REsponse"+response.body);

    print("REsponse Code"+response.statusCode.toString());
    var cuisinecategorydata = json.decode(response.body);
    List list =cuisinecategorydata['cuisine'];

    try {
      // int index=0;
      list.forEach((element) {
        tempcuisineCategoryData.add(Cuisine.fromJson(element));

      });
    } catch (e) {
      print("Something wrongdata${e.toString()}");
    }

    try {
      cuisinesubsubcategorydata.addAll(tempcuisineCategoryData);
    } catch (e) {
      print("Something wrong${e.toString()}");
    }

    return tempcuisineCategoryData;
  }


}