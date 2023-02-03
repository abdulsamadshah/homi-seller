import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:homlisellerapp/app/View/seller_details_view.dart';

import 'package:homlisellerapp/app/shared/color.dart';
import 'package:homlisellerapp/app/shared/widgets/choose_file_widget.dart';
import 'package:email_validator/email_validator.dart';
import 'package:homlisellerapp/app/shared/widgets/textfield_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../View_Model/registration_controller.dart';

import '../constants/fonts.dart';
import '../shared/utility.dart';
import 'package:get/get.dart';

import '../shared/validator.dart';

class RegistrationView extends StatefulWidget {
  const RegistrationView({Key? key}) : super(key: key);

  @override
  State<RegistrationView> createState() => _RegistrationViewState();
}






class _RegistrationViewState extends State<RegistrationView> with CodeAutoFill {
  final controller = Get.put(RegistrationController());
  bool _visible = false;
  bool _motpvisible = false;
  bool _mobileresend = false;
  bool _emailresend = false;
  bool _mobiletimervisible = false;
  bool _emailtimervisible = false;

  String codeValue = "";
  String? id, emailotp, mobileotp;

  bool disablesendmobileotpbutton = false;
  bool disablesendemailpbutton = false;

  @override
  void codeUpdated() {
    print("Update code $code");
    setState(() {
      print("codeUpdated");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    listenOtp();
    super.initState();
  }

  void listenOtp() async {
    await SmsAutoFill().unregisterListener();
    listenForCode();
    await SmsAutoFill().listenForCode;
    print("OTP listen Called");
  }

  @override
  void dispose() {
    SmsAutoFill().unregisterListener();
    print("unregisterListener");
    _timer.cancel();
    super.dispose();
  }

  late Timer _timer;
  int _start = 30;
  String? mobileotps, emailotps;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            _mobileresend = !_mobileresend;
            _mobiletimervisible = false;
            _start = 30;
            _mobileresend = true;
          });
        } else {
          setState(() {
            _start--;
            // _start--;
          });
        }
      },
    );
  }

  late Timer _timeremail;
  int _startemail = 30;

  void startTimeremail() {
    const oneSec = const Duration(seconds: 1);
    _timeremail = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_startemail == 0) {
          setState(() {
            timer.cancel();
            _emailresend = !_emailresend;
            _emailtimervisible = false;
            _startemail = 30;
            _emailresend = true;
          });
        } else {
          setState(() {
            _startemail--;
            // _start--;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Form(
            key: controller.registerKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 70, left: 25),
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w900,
                            fontSize: 25,
                            color: Color.fromRGBO(45, 39, 39, 1)),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Text(
                        'Create an account to get started',
                        style: TextStyle(
                            fontSize: 18,
                            color: FixedColors.grey,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    // height: 40,

                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      validator: Validator.validateName,
                      controller: controller.first_name_controller,
                      decoration: InputDecoration(
                        hintMaxLines: 10,
                        contentPadding: EdgeInsets.only(left: 10, top: 6),
                        hintText: 'Nikhil',
                        labelText: 'First Name',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 26,
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    // height: 40,

                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      validator: Validator.validateName,
                      controller: controller.last_name_controller,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10, top: 6),
                        hintText: 'Gupta',
                        labelText: 'Last Name',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0)),
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 26,
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    // height: 40,
                    child: Stack(
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.phone,
                          validator: Validator.validateNumber,
                          controller: controller.mobile_controller,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 10, top: 6),
                            hintText: 'Mobile Number',
                            labelText: 'Mobile Number',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0)),
                          ),
                        ),
                        AbsorbPointer(
                          absorbing: disablesendmobileotpbutton,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 240, top: 10),
                            child: InkWell(
                              onTap: () async {
                                if (controller.mobile_controller.text
                                            .toString() ==
                                        null ||
                                    controller.mobile_controller.text.isEmpty ||
                                    controller.mobile_controller.text == "") {
                                  Utility()
                                      .myfluttertoast("Mobile Number is empty");
                                } else if (controller
                                        .mobile_controller.text.length >
                                    10) {
                                  Utility().myfluttertoast(
                                      "Please enter the ten digit mobile Number");
                                } else if (controller
                                        .mobile_controller.text.length <
                                    10) {
                                  Utility().myfluttertoast(
                                      "Please enter the ten digit mobile Number");
                                } else {
                                  SharedPreferences userpref =
                                      await SharedPreferences.getInstance();
                                  id = userpref.getString('id') ?? '';
                                  emailotp =
                                      userpref.getString('email_otp') ?? '';
                                  mobileotp =
                                      userpref.getString('phone_otp') ?? '';
                                  print("My id${id}");
                                  print("My id${emailotp}");
                                  print("My id${mobileotp}");

                                  Map mobiledata = {
                                    'mobile_email': controller
                                        .mobile_controller.text
                                        .toString(),
                                    'process': "signup",
                                  };

                                  print("mobile otp response :${mobiledata}");

                                  controller
                                      .sendmobileotp(context, mobiledata)
                                      .then((value) {
                                    setState(() {
                                      _motpvisible = !_motpvisible;
                                      disablesendmobileotpbutton = true;
                                      _mobiletimervisible = true;
                                    });
                                    startTimer();

                                    print(codeValue);
                                  }).onError((error, stackTrace) {
                                    print(error.toString());
                                  });
                                  // setState(() {
                                  //   _motpvisible=!_motpvisible;
                                  // });
                                }
                              },
                              child: Container(
                                height: 30,
                                width: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: Color(0xfff5f5f5),
                                ),
                                child: Center(
                                    child: Text(
                                  "Send Otp",
                                  style: TextStyle(color: Colors.black54),
                                )),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // ChooseFileWidget(
                //   controller: controller.mobile_controller,
                //   hinttext: 'Mobile',
                //   subtitle: 'Verify',
                // ),
                SizedBox(
                  height: 26,
                ),
                Visibility(
                  visible: _motpvisible,
                  child: OtpTextField(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    decoration: const InputDecoration(
                        constraints:
                            BoxConstraints(minHeight: 0.5, minWidth: 0.5)),
                    borderWidth: 1,
                    keyboardType: TextInputType.number,
                    cursorColor: FixedColors.black,
                    numberOfFields: 4,
                    borderColor: FixedColors.purple,
                    showFieldAsBox: true,
                    focusedBorderColor: FixedColors.purple,
                    onCodeChanged: (code) {
                      print("onCodeChanged $code");
                      print("Mobile Otp" + code);
                    },
                    onSubmit: (val) {
                      print("onCodeSubmitted $val");
                      setState(() {
                        mobileotps = val;

                        print("User Mobile Otp" + mobileotps.toString());
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Visibility(
                  visible: _mobiletimervisible,
                  child: Center(
                      child: Text(
                    '$_start',
                    style: TextStyle(color: FixedColors.grey),
                  )),
                ),
                Visibility(
                  visible: _mobileresend,
                  child: InkWell(
                    onTap: () async {
                      if (controller.mobile_controller.text.toString() ==
                              null ||
                          controller.mobile_controller.text.isEmpty ||
                          controller.mobile_controller.text == "") {
                        Utility().myfluttertoast("Mobile Number is empty");
                      } else if (controller.mobile_controller.text.length >
                          10) {
                        Utility().myfluttertoast(
                            "Please enter the ten digit mobile Number");
                      } else if (controller.mobile_controller.text.length <
                          10) {
                        Utility().myfluttertoast(
                            "Please enter the ten digit mobile Number");
                      } else {
                        SharedPreferences userpref =
                            await SharedPreferences.getInstance();
                        id = userpref.getString('id') ?? '';
                        emailotp = userpref.getString('email_otp') ?? '';
                        mobileotp = userpref.getString('phone_otp') ?? '';
                        print("My id${id}");
                        print("My id${emailotp}");
                        print("My id${mobileotp}");

                        Map mobiledata = {
                          'mobile_email':
                              controller.mobile_controller.text.toString(),
                          'process': "signup",
                        };

                        print("mobile otp response :${mobiledata}");

                        controller
                            .sendmobileotp(context, mobiledata)
                            .then((value) {
                          setState(() {
                            setState(() {
                              _motpvisible = _motpvisible;
                              _mobiletimervisible = true;
                            });

                            startTimer();
                          });

                          print(codeValue);
                        }).onError((error, stackTrace) {
                          print(error.toString());
                        });
                        // setState(() {
                        //   _motpvisible=!_motpvisible;
                        // });
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, top: 10),
                      child: Text(
                        'Resend OTP',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            color: FixedColors.purple,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: Container(
                    // height: 40,
                    child: Stack(
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          validator: Validator.validateEmail,
                          controller: controller.email_controller,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 10, top: 6),
                            hintText: 'Email',
                            labelText: 'Email',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0)),
                          ),
                        ),
                        // TextField(
                        //   controller: controller.email_controller,
                        //   decoration: InputDecoration(
                        //     hintText: "Email",
                        //     labelText: "Email",
                        //     contentPadding: EdgeInsets.only(left: 10, top: 6),
                        //     border: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(15.0)),
                        //   ),
                        // ),
                        AbsorbPointer(
                          absorbing: disablesendemailpbutton,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 240, top: 10),
                            child: InkWell(
                              onTap: () async {
                                bool emailidvalidate = EmailValidator.validate(
                                    controller.email_controller.text
                                        .toString());
                                if (controller.mobile_controller.text
                                            .toString() ==
                                        null ||
                                    controller.mobile_controller.text.isEmpty ||
                                    controller.mobile_controller.text == "") {
                                  Utility().myfluttertoast("Email Id is empty");
                                } else if (emailidvalidate == false) {
                                  Utility().myfluttertoast(
                                      "Enter the proper Email Id");
                                } else {
                                  _timer.cancel();
                                  SharedPreferences userpref =
                                      await SharedPreferences.getInstance();
                                  id = userpref.getString('id') ?? '';
                                  emailotp =
                                      userpref.getString('email_otp') ?? '';
                                  mobileotp =
                                      userpref.getString('phone_otp') ?? '';
                                  print("My id${id}");
                                  print("My id${emailotp}");
                                  print("My id${mobileotp}");
                                  Map emailiddata = {
                                    'mobile_email': controller
                                        .email_controller.text
                                        .toString(),
                                    'process': "signup",
                                    'id': id.toString(),
                                  };
                                  print("data:${emailiddata}");

                                  controller
                                      .sendemailOtp(context, emailiddata)
                                      .then((value) {
                                    setState(() {
                                      _visible = !_visible;
                                      disablesendemailpbutton = true;
                                      _emailtimervisible = true;
                                    });
                                    startTimeremail();

                                    print(codeValue);
                                  }).onError((error, stackTrace) {
                                    print(error.toString());
                                  });
                                }
                              },
                              child: Container(
                                height: 30,
                                width: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: Color(0xfff5f5f5),
                                ),
                                child: Center(
                                    child: Text(
                                  "Send Otp",
                                  style: TextStyle(color: Colors.black54),
                                )),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Visibility(
                  visible: _visible,
                  child: OtpTextField(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    decoration: const InputDecoration(
                        constraints:
                            BoxConstraints(minHeight: 0.5, minWidth: 0.5)),
                    borderWidth: 1,
                    keyboardType: TextInputType.number,
                    cursorColor: FixedColors.black,
                    numberOfFields: 4,
                    borderColor: FixedColors.purple,
                    showFieldAsBox: true,
                    focusedBorderColor: FixedColors.purple,
                    onCodeChanged: (code) {
                      print("onCodeChanged $code");
                      setState(() {
                        codeValue = code.toString();
                      });
                    },
                    onSubmit: (val) {
                      emailotps = val;
                      print("User Email Otp ${emailotps}");
                    },
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Visibility(
                  visible: _emailtimervisible,
                  child: Center(
                      child: Text(
                    '$_startemail',
                    style: TextStyle(color: FixedColors.grey),
                  )),
                ),
                Visibility(
                  visible: _emailresend,
                  child: InkWell(
                    onTap: () async {
                      bool emailidvalidate = EmailValidator.validate(
                          controller.email_controller.text.toString());
                      if (controller.mobile_controller.text.toString() ==
                              null ||
                          controller.mobile_controller.text.isEmpty ||
                          controller.mobile_controller.text == "") {
                        Utility().myfluttertoast("Email Id is empty");
                      } else if (emailidvalidate == false) {
                        Utility().myfluttertoast("Enter the proper Email Id");
                      } else {
                        _timer.cancel();
                        SharedPreferences userpref =
                            await SharedPreferences.getInstance();
                        id = userpref.getString('id') ?? '';
                        emailotp = userpref.getString('email_otp') ?? '';
                        mobileotp = userpref.getString('phone_otp') ?? '';
                        print("My id${id}");
                        print("My id${emailotp}");
                        print("My id${mobileotp}");
                        Map emailiddata = {
                          'mobile_email':
                              controller.email_controller.text.toString(),
                          'process': "signup",
                          'id': id.toString(),
                        };
                        print("data:${emailiddata}");

                        controller
                            .sendemailOtp(context, emailiddata)
                            .then((value) {
                          setState(() {
                            // _visible = !_visible;
                            _emailtimervisible = true;
                          });
                          startTimeremail();

                          print(codeValue);
                        }).onError((error, stackTrace) {
                          print(error.toString());
                        });
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, top: 10),
                      child: Text(
                        'Resend OTP',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            color: FixedColors.purple,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SellerDetail()));
                    },
                    child: InkWell(
                      onTap: () async {
                        if (controller.registerKey.currentState!.validate()) {
                          try {
                            SharedPreferences userpref =
                                await SharedPreferences.getInstance();
                            setState(() {
                              id = userpref.getString('id') ?? '';
                              emailotp = userpref.getString('email_otp') ?? '';
                              mobileotp = userpref.getString('phone_otp') ?? '';
                            });
                            print("My id${id}");
                            print("My id${emailotp}");
                            print("My id${mobileotp}");
                            print("Mobile Otp data" + mobileotps.toString());

                            Map Registerparam = {
                              'first_name': controller.first_name_controller.text
                                  .toString(),
                              'last_name': controller.last_name_controller.text
                                  .toString(),
                              'phone':
                                  controller.mobile_controller.text.toString(),
                              'email':
                                  controller.email_controller.text.toString(),
                              'email_otp': emailotp.toString(),
                              'phone_otp': mobileotp.toString(),
                              'id': id.toString(),
                            };
                            print("Register data:${Registerparam}");
                            controller.Register(context, Registerparam,
                                mobileotps.toString(), emailotps.toString());
                          } catch (e) {
                            print(e.toString());
                          }
                        } else {
                          // Utility().myfluttertoast("Enter the Valid Data");
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Center(
                          child: Container(
                            height: 48,
                            decoration: BoxDecoration(
                              color: FixedColors.purple,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                'Next',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: PoppinsSemibold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
