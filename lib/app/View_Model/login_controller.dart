import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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



  Future<void> loginauth(BuildContext context, dynamic data) async {
    repo.loginrepo(data).then((value) {
      Utility().myfluttertoast(value['msg'].toString());
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeView()));
      print(value['msg']);
    }).onError((error, stackTrace) {
      Utility().myfluttertoast(error.toString());
      print(error.toString());
    });
  }

}
