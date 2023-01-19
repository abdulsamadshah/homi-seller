import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../Network/Repositary/Register.dart';
import '../routes/RoutesName.dart';
import '../shared/utility.dart';

class PersonalDetailscontroller extends GetxController {
  final GlobalKey<FormState> personaldetailsKey = GlobalKey<FormState>();
  TextEditingController pancardnumber = TextEditingController();
  TextEditingController addharcardnumber = TextEditingController();

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
    pancardnumber.dispose();
    addharcardnumber.dispose();
  }

  Registerrepo repo = Registerrepo();

  Future<void> Personaldata(BuildContext context, dynamic data) async {
    await repo.Registerationrep(data).then((value) {
      if (value['status'] == "true") {
        print(value['msg']);
        print("this working right");
        Utility().myfluttertoast(value['msg']);
        Navigator.pushNamed(context, RoutesName.ShopDetails);
      }
    }).onError((error, stackTrace) {
      Utility().myfluttertoast(error.toString());
      print(error.toString());
      print("this working wrong");
    });
  }
}
