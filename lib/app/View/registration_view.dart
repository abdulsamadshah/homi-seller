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

class RegistrationView extends StatefulWidget {
  const RegistrationView({Key? key}) : super(key: key);

  @override
  State<RegistrationView> createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> with CodeAutoFill {
  final controller = Get.put(RegistrationController());
  bool _visible = false;
  bool _motpvisible = false;
  String codeValue = "";
  String? id, emailotp, mobileotp;

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
  int _start = 0;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 30) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start++;
            // _start--;
          });
        }
      },
    );
  }

  late Timer _timeremail;
  int _startemail = 0;

  void startTimeremail() {
    const oneSec = const Duration(seconds: 1);
    _timeremail = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_startemail == 30) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _startemail++;
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
                TextFieldWidget(
                  controller: controller.first_name_controller,
                  hintText: 'Nikhil',
                  labelText: 'First Name',
                ),
                const SizedBox(
                  height: 26,
                ),
                TextFieldWidget(
                    controller: controller.last_name_controller,
                    hintText: 'Gupta',
                    labelText: 'Last Name'),
                const SizedBox(
                  height: 26,
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    height: 40,
                    child: Stack(
                      children: [
                        TextField(
                          controller: controller.mobile_controller,
                          decoration: InputDecoration(
                            hintText: "Mobile Number",
                            contentPadding: EdgeInsets.only(left: 10, top: 6),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 240, top: 6),
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
                              height: 25,
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
                      setState(() {
                        codeValue = code.toString();
                      });
                    },
                    onSubmit: (val) {
                      print("onCodeSubmitted $val");
                    },
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Visibility(
                  visible: _motpvisible,
                  child: Center(
                      child: Text(
                    '$_start',
                    style: TextStyle(color: FixedColors.grey),
                  )),
                ),
                Visibility(
                  visible: _motpvisible,
                  child: InkWell(
                    onTap: () {
                      listenOtp();
                      startTimer();
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
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
                  child: Container(
                    height: 40,
                    child: Stack(
                      children: [
                        TextField(
                          controller: controller.email_controller,
                          decoration: InputDecoration(
                            hintText: "Email",
                            contentPadding: EdgeInsets.only(left: 10, top: 6),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 240, top: 6),
                          child: InkWell(
                            onTap: () async {
                              bool emailidvalidate = EmailValidator.validate(
                                  controller.email_controller.text.toString());
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
                                  });
                                  startTimeremail();

                                  print(codeValue);
                                }).onError((error, stackTrace) {
                                  print(error.toString());
                                });
                              }
                            },
                            child: Container(
                              height: 25,
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
                      print("onCodeSubmitted $val");
                    },
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Visibility(
                  visible: _visible,
                  child: Center(
                      child: Text(
                    '$_startemail',
                    style: TextStyle(color: FixedColors.grey),
                  )),
                ),
                Visibility(
                  visible: _visible,
                  child: InkWell(
                    onTap: () {
                      listenOtp();
                      startTimer();
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
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: [
                //     Padding(
                //       padding: const EdgeInsets.only(left: 10),
                //       child: Icon(
                //         Icons.check_box_outline_blank_outlined,
                //         color: FixedColors.grey,
                //       ),
                //     ),
                //     const SizedBox(
                //       width: 3,
                //     ),
                //     Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         Row(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           crossAxisAlignment: CrossAxisAlignment.center,
                //           children: [
                //             Text(
                //               'I have read and agree with the',
                //               style: TextStyle(
                //                   fontSize: 12,
                //                   color: FixedColors.grey,
                //                   fontFamily: 'Poppins',
                //                   fontWeight: FontWeight.w600),
                //             ),
                //             InkWell(
                //               onTap: () {},
                //               child: Text(
                //                 ' Terms & conditions,',
                //                 style: TextStyle(
                //                     fontSize: 12,
                //                     color: FixedColors.purple,
                //                     fontFamily: 'Poppins',
                //                     fontWeight: FontWeight.w600),
                //               ),
                //             ),
                //           ],
                //         ),
                //         Row(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           crossAxisAlignment: CrossAxisAlignment.center,
                //           children: [
                //             InkWell(
                //               onTap: () {},
                //               child: Text(
                //                 'Privacy Policy',
                //                 style: TextStyle(
                //                     fontSize: 12,
                //                     color: FixedColors.purple,
                //                     fontWeight: FontWeight.w600),
                //               ),
                //             ),
                //             Text(
                //               ' & ',
                //               style: TextStyle(
                //                   fontSize: 12,
                //                   color: FixedColors.grey,
                //                   fontFamily: 'Poppins',
                //                   fontWeight: FontWeight.w600),
                //             ),
                //             InkWell(
                //               onTap: () {},
                //               child: Text(
                //                 'End User License Agreement ',
                //                 style: TextStyle(
                //                     fontSize: 12,
                //                     color: FixedColors.purple,
                //                     fontFamily: 'Poppins',
                //                     fontWeight: FontWeight.w600),
                //               ),
                //             ),
                //           ],
                //         )
                //       ],
                //     )
                //   ],
                // ),

                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SellerDetail()));
                    },
                    child: InkWell(
                      onTap: () async {
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

                        Map Registerparam = {
                          'first_name':
                              controller.first_name_controller.text.toString(),
                          'last_name':
                              controller.last_name_controller.text.toString(),
                          'phone': controller.mobile_controller.text.toString(),
                          'email': controller.email_controller.text.toString(),
                          'email_otp': emailotp.toString(),
                          'phone_otp': mobileotp.toString(),
                          'id': id.toString(),
                        };
                        print("Register data:${Registerparam}");
                        controller.Register(context, Registerparam);

                        print("My ids:${id}");
                        print("My ids:${emailotp}");
                        print("My ids:${mobileotp}");
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
