import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homlisellerapp/app/routes/RoutesName.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Network/Repositary/Register.dart';
import '../View/home_view.dart';
import '../shared/utility.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController
  TextEditingController email_controller = TextEditingController();
  Registerrepo repo = Registerrepo();
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void dispose() {
    email_controller.dispose();
    super.dispose();
  }

  void increment() => count.value++;



  Future<bool> saveloginotp(String loginotp, String loginmobno) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString("loginotp", loginotp);
    sp.setString("loginmobno", loginmobno);
    update();
    return true;
  }

  Future<void> loginbyotp(BuildContext context, dynamic data,String loginmono) async {
    repo.loginotp(data).then((value) {

      Utility().myfluttertoast("Send Otp Successfully");
      print("My Email Otp"+value['data']['email_otp'].toString());
      saveloginotp(value['data']['email_otp'],loginmono);
      // if(value['status'] == "true"){
      //   if(value['msg'] == "Seller Verification Level 1 Pending"){
      //     Utility().myfluttertoast(value['message'].toString());
      //     Navigator.pushNamed(context, RoutesName.REGISTRATION);
      //   }else if(value['msg'] == "Seller Verification Level 2 Pending"){
      //     Utility().myfluttertoast(value['message'].toString());
      //     Navigator.pushNamed(context, RoutesName.PersonalDetails);
      //   }else if(value['msg'] == "Seller Verification Level 3 Pending"){
      //     Utility().myfluttertoast(value['message'].toString());
      //     Navigator.pushNamed(context, RoutesName.ShopDetails);
      //   }else{
      //     print("something wrong response");
      //   }
      //
      // }


      // Utility().myfluttertoast(value['message'].toString());
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => HomeView()));
      // print(value['message']);
    }).onError((error, stackTrace) {
      Utility().myfluttertoast(error.toString());
      print(error.toString());
    });
  }


  Future<void> loginauthmain(BuildContext context, dynamic data,String userinputotp, String mobileotp) async {
    repo.loginautmains(data).then((value) {

      Utility().myfluttertoast("Send Otp Successfully");

      if(value['status'] == "true"){
        if(userinputotp == mobileotp){

          if(value['msg'] == "Seller Verification Level 1 Pending"){
            Utility().myfluttertoast(value['msg'].toString());
            Navigator.pushNamed(context, RoutesName.REGISTRATION);
          }else if(value['msg'] == "Seller Verification Level 2 Pending"){
            Utility().myfluttertoast(value['msg'].toString());
            Navigator.pushNamed(context, RoutesName.PersonalDetails);
          }else if(value['msg'] == "Seller Verification Level 3 Pending"){
            Utility().myfluttertoast(value['msg'].toString());
            Navigator.pushNamed(context, RoutesName.ShopDetails);
          }else{
            print("something wrong response");
          }

        }else{
          print("status issue");
        }
      }


      // Utility().myfluttertoast(value['message'].toString());
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => HomeView()));
      // print(value['message']);
    }).onError((error, stackTrace) {
      Utility().myfluttertoast(error.toString());
      print(error.toString());
    });
  }

}
