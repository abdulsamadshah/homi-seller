import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:homlisellerapp/app/shared/color.dart';

import '../constants/colors.dart';

class Utility {
  static bool isNullEmptyOrFalse(Object? o) {
    return o == null ||
        o == "0.0" ||
        o == "0" ||
        o == 0 ||
        false == o ||
        "" == o ||
        "null" == o ||
        "false" == o;
  }

  static bool isNotNullEmptyOrFalse(Object? o) {
    return !isNullEmptyOrFalse(o);
  }

  void myfluttertoast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor:Appcolors.Toastcolor,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
