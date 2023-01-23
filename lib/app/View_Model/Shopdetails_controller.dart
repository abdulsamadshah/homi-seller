import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Network/Repositary/Register.dart';
import '../routes/RoutesName.dart';
import '../shared/utility.dart';
class ShopdetailsController extends GetxController{

  final GlobalKey<FormState> shopdetailsKey = GlobalKey<FormState>();
  TextEditingController companyname=TextEditingController();
  TextEditingController companypannumber=TextEditingController();
  TextEditingController companygstnumber=TextEditingController();
  TextEditingController companyfssainumber=TextEditingController();
  TextEditingController companyfssaidate=TextEditingController();
  TextEditingController companywhatsappnumber=TextEditingController();
  TextEditingController companybrandname=TextEditingController();
  TextEditingController companyaddress=TextEditingController();
  TextEditingController companyaddress2=TextEditingController();
  TextEditingController companypincode=TextEditingController();


  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    companyname.dispose();
    companypannumber.dispose();
    companygstnumber.dispose();
    companyfssainumber.dispose();
    companyfssaidate.dispose();
    companywhatsappnumber.dispose();
    companybrandname.dispose();
    companyaddress.dispose();
    companyaddress2.dispose();
    companypincode.dispose();
  }

  Registerrepo repo = Registerrepo();

  Future<void> sellerShopdetail(BuildContext context, dynamic data) async {
    await repo.Registerationrep(data).then((value) {

      print(value['message']);
      print("this working right");
      Utility().myfluttertoast(value['message']);
      Navigator.pushNamed(context, RoutesName.HOME);
    }).onError((error, stackTrace) {
      Utility().myfluttertoast(error.toString());
      print(error.toString());
      print("this working wrong");
    });
  }

  Future<bool> saveStateId(String stateid) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString("StateId", stateid);
    return true;
  }

  Future<bool> saveCityId(String Cityid) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString("CityId", Cityid);
    return true;
  }

}