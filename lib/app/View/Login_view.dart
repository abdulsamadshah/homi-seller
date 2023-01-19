import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:homlisellerapp/app/View/registration_view.dart';
import 'package:homlisellerapp/app/routes/RoutesName.dart';
import 'package:homlisellerapp/app/shared/color.dart';
import 'package:homlisellerapp/app/shared/utility.dart';
import 'package:homlisellerapp/app/shared/widgets/textfield_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../View_Model/login_controller.dart';
import 'home_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with CodeAutoFill {
  final controller = Get.put(LoginController());
  bool _visible = false;
  bool _loginviootpvisible = true;
  bool _resendotpvisible = false;
  bool _timervisible = false;

  String codeValue = "";
  late Timer _timer;
  int _start = 30;
  String? loginotp;
  String? userinputotp;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            _resendotpvisible = !_resendotpvisible;
            _timervisible = false;
            _start = 30;
            _resendotpvisible = true;
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

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
    super.initState();
    listenOtp();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 25),
                child: Center(
                  child: CircleAvatar(
                    radius: 128,
                    backgroundColor: Colors.transparent,
                    child: Image(
                      image: AssetImage('assets/images/png/homilylogo.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Text(
                'Namaste!',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                    color: FixedColors.black,
                    fontFamily: 'Poppins'),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFieldWidget(
                  controller: controller.email_controller,
                  hintText: 'Nikhil.Zrow@gmail.com',
                  labelText: 'Email / Phone'),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                    visible: _resendotpvisible,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 35),
                      child: InkWell(
                        onTap: () {
                          if (controller.email_controller.text.toString() ==
                                  null ||
                              controller.email_controller.text.isEmpty ||
                              controller.email_controller.text == "") {
                            Utility().myfluttertoast("Value is empty");
                          } else {
                            Map emailiddata = {
                              'mobile_email':
                                  controller.email_controller.text.toString(),
                            };
                            print("loginparametres: ${emailiddata}");
                            loginbyotpresend(context, emailiddata,
                                controller.email_controller.text.toString());
                          }
                        },
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
                  InkWell(
                    onTap: () {
                      if (controller.email_controller.text.toString() == null ||
                          controller.email_controller.text.isEmpty ||
                          controller.email_controller.text == "") {
                        Utility().myfluttertoast("Value is empty");
                      } else {
                        Map emailiddata = {
                          'mobile_email':
                              controller.email_controller.text.toString(),
                        };

                        print("loginparametres: ${emailiddata}");

                        loginbyotp(context, emailiddata,
                            controller.email_controller.text.toString());
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 35),
                      child: Visibility(
                        visible: _loginviootpvisible,
                        child: Text(
                          'Login via OTP',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              color: FixedColors.purple,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
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
                    userinputotp = val;
                    print("User Input Email Id: ${userinputotp}");
                  },
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Visibility(
                visible: _timervisible,
                child: Center(
                    child: Text(
                  '$_start',
                  style: TextStyle(color: FixedColors.grey),
                )),
              ),
              const SizedBox(
                height: 5,
              ),
              InkWell(
                onTap: () async {
                  SharedPreferences userpref =
                      await SharedPreferences.getInstance();
                  loginotp = userpref.getString('loginotp') ?? '';

                  Map mainlogindata = {
                    'mobile_email': controller.email_controller.text.toString(),
                    'otp': loginotp.toString(),
                  };

                  controller.loginauthmain(context, mainlogindata,
                      userinputotp.toString(), loginotp.toString());
                },
                child: Container(
                  width: 290,
                  height: 40,
                  decoration: BoxDecoration(
                    color: FixedColors.purple,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Want to be a Seller? ',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: FixedColors.grey),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const RegistrationView()));
                    },
                    child: const Text(
                      'Register Now',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: Colors.blue),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Follow us on ',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: FixedColors.grey),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      margin:
                          const EdgeInsets.only(right: 8, left: 8, bottom: 8),
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: const Image(
                          image:
                              AssetImage('assets/images/png/instagram 1.png')),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      margin:
                          const EdgeInsets.only(right: 8, left: 8, bottom: 8),
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: const Image(
                          image: AssetImage(
                              'assets/images/png/facebook (1) 1.png')),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      margin:
                          const EdgeInsets.only(right: 8, left: 8, bottom: 8),
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: const Image(
                          image: AssetImage(
                              'assets/images/png/twitter (1) 1.png')),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      margin:
                          const EdgeInsets.only(right: 8, left: 8, bottom: 8),
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: const Image(
                          image: AssetImage('assets/images/png/youtube 1.png')),
                    ),
                  ),
                ],
              )
            ],
          ),
        )),
      ),
    );
  }

  Future<void> loginbyotp(
      BuildContext context, dynamic data, String loginmono) async {
    final response = await http.post(
        Uri.parse("http://homliadmin.globusachievers.com/api/seller-login-otp"),
        body: data);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      if (data['status'] == "true") {
        _visible = !_visible;
        _loginviootpvisible = !_loginviootpvisible;
        _timervisible = true;
        startTimer();
        print(codeValue);

        print("INput emailandmobno:" + loginmono);
        print("Messages" + data['msg']);
        print("Server Email Otp" + data['data']['email_otp'].toString());
        controller.saveloginotp(
            data['data']['email_otp'].toString(), loginmono);
        Utility().myfluttertoast("Send Otp Successfully");
      } else {
        Utility().myfluttertoast("Please Enter Valid Email Id");
      }
    } else {
      Utility().myfluttertoast("Please Enter Valid Email Id");
    }
  }

  Future<void> loginbyotpresend(
      BuildContext context, dynamic data, String loginmono) async {
    final response = await http.post(
        Uri.parse("http://homliadmin.globusachievers.com/api/seller-login-otp"),
        body: data);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      if (data['status'] == "true") {
        _timervisible = true;
        startTimer();
        print(codeValue);

        print("INput emailandmobno:" + loginmono);
        print("Messages" + data['msg']);
        print("Server Email Otp" + data['data']['email_otp'].toString());
        controller.saveloginotp(
            data['data']['email_otp'].toString(), loginmono);
        Utility().myfluttertoast("Send Otp Successfully");
      } else {
        Utility().myfluttertoast("Please Enter Valid Email Id");
      }
    } else {
      Utility().myfluttertoast("Please Enter Valid Email Id");
    }
  }
}
