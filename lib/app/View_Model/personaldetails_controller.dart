import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../Network/Repositary/Register.dart';
import '../routes/RoutesName.dart';
import '../shared/utility.dart';

class PersonalDetailscontroller with ChangeNotifier{
  // final GlobalKey<FormState> personaldetailsKey = GlobalKey<FormState>();
  // TextEditingController pancardnumber = TextEditingController();
  // TextEditingController addharcardnumber = TextEditingController();


  Registerrepo repo = Registerrepo();

  Future<void> Personaldata(BuildContext context, dynamic data) async {
    await repo.sellerpersonaldetails(data).then((value) {
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
