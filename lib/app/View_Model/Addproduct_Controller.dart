import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/Category.dart';
import '../model/Cuisine_model.dart';
import '../model/SubSubCategory_model.dart';
import '../model/StateData_model.dart';
import 'package:http/http.dart' as http;

import '../service/Mulitpledropdownservices.dart';
class AddproductController extends GetxController{


  Future<bool> SaveMainCategoryId(String SubcategoryId) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString("maincategoryId", SubcategoryId);
    return true;
  }

  Future<bool> SavesubcategoryId(String SubcategoryId) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString("subcategoryId", SubcategoryId);
    return true;
  }

  Future<bool> SavesubsubcategoryId(String SubcategoryId) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString("subsubcategoryId", SubcategoryId);
    return true;
  }









  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    // fetchCategory();
    // print("All Data${_district.value.toString()}");
  }

  /*
  List<MultiSelectItem> dropDownData = [];
  List<Category> subjectData = [];
  // SubjectModel models=SubjectModel();
  fetchSubSubCategory()async {
    subjectData.clear();
    dropDownData.clear();

    try {
      var data =  await Muiltidropdown().getstatedata();
      try {
        dropDownData = data.map((subjectdata) {
          return MultiSelectItem(subjectdata, subjectdata.name);
        }).toList();

        update();
      } catch (errors) {
        print("here is issue datas");
      }
    } catch (e) {
    } finally {

    }
  }

   */


  //SubSub Category
  List<MultiSelectItem> SubsubCategoryDropdownData = [];
  List<SubSubCategory> SubSubcategoryData = [];
  getSubSubCategory()async {
    SubSubcategoryData.clear();
    SubsubCategoryDropdownData.clear();

    try {
      var data =  await Muiltidropdown().getSubSubCategorydata();
      try {
        SubsubCategoryDropdownData = data.map((subjectdata) {
          print("here");
          return MultiSelectItem(subjectdata, subjectdata.name);
        }).toList();

        update();
      } catch (errors) {
        print("here is issue datas");
      }
    } catch (e) {
      print("something wrong datas"+e.toString());
    } finally {

    }
  }



  //Cuisine
  List<MultiSelectItem> CuisineCategoryDropdownData = [];
  List<Cuisine> CuisinecategoryData = [];
  getCuisineCategory()async {
    CuisinecategoryData.clear();
    CuisineCategoryDropdownData.clear();

    try {
      var data =  await Muiltidropdown().getcuisineCategorydata();
      try {
        CuisineCategoryDropdownData = data.map((subjectdata) {
          print("here");
          return MultiSelectItem(subjectdata, subjectdata.name);
        }).toList();

        update();
      } catch (errors) {
        print("here is issue datas");
      }
    } catch (e) {
      print("something wrong datas"+e.toString());
    } finally {

    }
  }



}