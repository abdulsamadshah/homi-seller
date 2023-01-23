import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homlisellerapp/app/routes/RoutesName.dart';
import 'package:homlisellerapp/app/shared/utility.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Network/Repositary/Register.dart';
import '../View/home_view.dart';
import '../model/OtpsendModel.dart';

class RegistrationController extends GetxController {
  final GlobalKey<FormState> registerKey = GlobalKey<FormState>();
  TextEditingController first_name_controller = TextEditingController();
  TextEditingController last_name_controller = TextEditingController();
  TextEditingController mobile_controller = TextEditingController();
  TextEditingController email_controller = TextEditingController();

  String _mobilenumber = '';

  String get mobilenumber => _mobilenumber;

  String _id = '';

  String get id => _id;

  Registerrepo repo = Registerrepo();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    first_name_controller.dispose();
    last_name_controller.dispose();
    mobile_controller.dispose();
    email_controller.dispose();
    super.dispose();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<bool> saveMobileotp(String phoneotp, String id) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString("phone_otp", phoneotp);
    sp.setString("id", id);

    update();
    return true;
  }

  Future<bool> saveEmailotp(String email_otp) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString("email_otp", email_otp);
    update();
    return true;
  }

  void removeuserdata() async {
    SharedPreferences deleteuserdata = await SharedPreferences.getInstance();
    deleteuserdata.remove('email_otp');
    deleteuserdata.remove('phone_otp');
    update();
  }

  Future<void> sendmobileotp(BuildContext context, dynamic data) async {
    repo.Sendotprepo(data).then((value) {
      Utility().myfluttertoast("Send Otp Successfully");

      //he is read to single response
      print("MObile Otp Message:" + value['msg']);

      //he is read to Multi array response
      print("MObile otp:" + value['data']['phone_otp'].toString());
      print("Id:" + value['data']['id'].toString());
      saveMobileotp(value['data']['phone_otp'].toString(),
          value['data']['id'].toString());
    }).onError((error, stackTrace) {
      Utility().myfluttertoast(error.toString());
      print(error.toString());
    });
  }


  Future<void> sendemailOtp(BuildContext context, dynamic data) async {
    repo.Sendotprepo(data).then((value) {
      Utility().myfluttertoast("Send Otp Successfully");
      print("Email Otp Message:" + value['msg']);
      print(value['email_otp'].toString());
      print(value['id'].toString());
      saveEmailotp(value['data']['email_otp'].toString());
      print("Email otp:" + value['data']['email_otp'].toString());
    }).onError((error, stackTrace) {
      Utility().myfluttertoast(error.toString());
      print(error.toString());
    });
  }

  Future<void> Register(BuildContext context, dynamic data,
      String inputmobileot, String inputemailotp) async {
    await repo.Registerationrep(data).then((value) {
      print(value['msg']);

      print(value['data']['email_verify']);
      print(value['data']['phone_verify']);
      print("Server Phone Otp" + value['data']['phone_otp']);
      print("Server Email Otp" + value['data']['email_otp']);
      print(value['statuss']);

      if (value['status'] == "true") {
        if (value['data']['email_verify'] == "yes" ||
            value['data']['phone_verify'] == "yes") {
          if (inputmobileot == value['data']['phone_otp'] &&
              inputemailotp == value['data']['email_otp']) {
            print(value['msg'].toString());
            Utility().myfluttertoast("User created Successfully");
            Navigator.pushNamed(context, RoutesName.PersonalDetails);
          } else {
            Utility().myfluttertoast("Otp was wrong");
          }
        } else if (value['data']['email_verify'] == "no" ||
            value['data']['phone_verify'] == "no") {
          Utility().myfluttertoast("Veriefy the Email/Mob");
        }
      } else {
        debugPrint("response wrong");
        Utility().myfluttertoast("Enter the Valid Data");
      }

      // print("this working right");
      // Utility().myfluttertoast(value['msg'].toString());
      // Navigator.pushNamed(context, RoutesName.PersonalDetails);
    }).onError((error, stackTrace) {
      Utility().myfluttertoast(error.toString());
      print(error.toString());
      print("this working wrong");
    });
  }
}
