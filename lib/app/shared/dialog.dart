import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:homlisellerapp/app/shared/appTheme.dart';
import 'package:homlisellerapp/app/shared/color.dart';

enum ExitAction { YES, NO }

class DialogBox {
  static Future<ExitAction?> panda(BuildContext context) {
    return showDialog<ExitAction>(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 10,
                ),
                const Image(image: AssetImage('assets/images/png/panda.png')),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'We will update you about Profile changes approve or not Via email',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(133, 133, 133, 1)),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 142,
                    height: 39,
                    decoration: BoxDecoration(
                      color: FixedColors.purple,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Okay',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static Future<ExitAction?> upload(BuildContext context) {
    return showDialog<ExitAction>(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            title: Center(
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 166,
                    width: 271,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromRGBO(217, 217, 217, 1)),
                    child: Center(
                      child: Text(
                        'Select File To Upload',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 15,
                            color: FixedColors.purple,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Cancel",
                              style: TextStyle(
                                  color: FixedColors.purple,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15))),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: 142,
                          height: 39,
                          decoration: BoxDecoration(
                            color: FixedColors.purple,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              'Allow Changes',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static Future<ExitAction?> allowChanges(BuildContext context) {
    return showDialog<ExitAction>(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            title: Center(
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 10,
                  ),
                  const Image(
                      image: AssetImage('assets/images/png/exclamation.png')),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Your changes will freeze the store and sales cannot be made until the changes are approve',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 17,
                        color: Color.fromRGBO(133, 133, 133, 1),
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Cancel",
                              style: TextStyle(
                                  color: FixedColors.purple,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15))),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: 142,
                          height: 39,
                          decoration: BoxDecoration(
                            color: FixedColors.purple,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              'Allow Changes',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static Future<ExitAction?> exitDialog(BuildContext context) {
    return showDialog<ExitAction>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          title: Center(
            child: Column(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: Text(
                    'Are you sure you want to exit?',
                    style: TextStyle(
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.normal,
                        fontSize: 16.0),
                    textAlign: TextAlign.center,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Expanded(
                      child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("NO",
                              style: TextStyle(color: Colors.black))),
                    ),
                    SizedBox(
                      width: 140,
                      child: MyAppTheme.roundOutlinedTextButton(
                        onPressed: () {
                          exit(0);
                        },
                        btnText: "YES",
                        textSize: 14,
                        textColor: Colors.white,
                        // buttonColor: Theme.of(context).primaryColor
                        buttonColor: const Color.fromARGB(244, 112, 74, 250),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static Future<ExitAction?> confirmDialog(
      BuildContext context, String message, Function()? callback) {
    return showDialog<ExitAction>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          title: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: Text(
                    message.toString(),
                    style: const TextStyle(
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.normal,
                        fontSize: 16.0),
                    textAlign: TextAlign.center,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Expanded(
                      child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("NO",
                              style: TextStyle(color: Colors.black))),
                    ),
                    SizedBox(
                      width: 140,
                      child: MyAppTheme.roundOutlinedTextButton(
                        onPressed: callback
                        // exit(0);
                        ,
                        btnText: "YES",
                        textSize: 14,
                        textColor: Colors.white,
                        buttonColor: const Color.fromARGB(255, 0, 63, 141),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static Future<Widget?> okDialog(BuildContext context, String message,
      {onPressed}) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32))),
            title: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 15.0),
                    child: Text(
                      message,
                      style: const TextStyle(
                          fontFamily: 'poppins',
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.25,
                    height: 35,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          onPrimary: const Color(0xff007A82),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          minimumSize: Size(
                              MediaQuery.of(context).size.width * 0.95, 40.0)),
                      onPressed: () {
                        Navigator.pop(context);
                        onPressed();
                      },

                      // textColor: Colors.white,
                      child: const Text(
                        "OK",
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static Future<ExitAction?> thankYouOne(BuildContext context) {
    return showDialog<ExitAction>(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            title: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const <Widget>[
                  Image(image: AssetImage('assets/images/png/done1.png')),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Thank you for your details',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'The first step in your approval process is that you verify your email address. Click on the verification link sent in the email provided.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'We shall revert back to you via Email/Whatsapp once your account is approved.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static Future<ExitAction?> thankYouTwo(BuildContext context) {
    return showDialog<ExitAction>(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            title: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const <Widget>[
                  Image(image: AssetImage('assets/images/png/done2.png')),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Thank you for your details',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'The first step in your approval process is that you verify your email address. Click on the verification link sent in the email provided.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'We shall revert back to you via Email/Whatsapp once your account is approved.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
