import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import 'package:homlisellerapp/app/modules/registration/views/seller_details_view.dart';
import 'package:homlisellerapp/app/shared/color.dart';
import 'package:homlisellerapp/app/shared/widgets/choose_file_widget.dart';

import 'package:homlisellerapp/app/shared/widgets/textfield_widget.dart';
import '../controllers/registration_controller.dart';

class RegistrationView extends GetView<RegistrationController> {
  const RegistrationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                height: 10,
              ),
              TextFieldWidget(
                controller: controller.first_name_controller,
                hintText: 'Nikhil',
                labelText: 'First Name',
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldWidget(
                  controller: controller.last_name_controller,
                  hintText: 'Gupta',
                  labelText: 'Last Name'),
              const SizedBox(
                height: 10,
              ),
              ChooseFileWidget(
                controller: controller.mobile_controller,
                hinttext: 'Mobile',
                subtitle: 'Verify',
              ),
              const SizedBox(
                height: 10,
              ),
              OtpTextField(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                decoration: const InputDecoration(
                    constraints: BoxConstraints(minHeight: 0.5, minWidth: 0.5)),
                borderWidth: 1,
                keyboardType: TextInputType.number,
                cursorColor: FixedColors.black,
                numberOfFields: 4,
                borderColor: FixedColors.purple,
                showFieldAsBox: true,
                focusedBorderColor: FixedColors.purple,
              ),
              const SizedBox(
                height: 5,
              ),
              Center(
                  child: Text(
                '00:30',
                style: TextStyle(color: FixedColors.grey),
              )),
              ChooseFileWidget(
                hinttext: 'Email',
                subtitle: 'Verify',
              ),
              const SizedBox(
                height: 10,
              ),
              OtpTextField(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                decoration: const InputDecoration(
                    constraints: BoxConstraints(minHeight: 0.5, minWidth: 0.5)),
                borderWidth: 1,
                keyboardType: TextInputType.number,
                cursorColor: FixedColors.black,
                numberOfFields: 4,
                borderColor: FixedColors.purple,
                showFieldAsBox: true,
                focusedBorderColor: FixedColors.purple,
              ),
              const SizedBox(
                height: 5,
              ),
              Center(
                  child: Text(
                '00:30',
                style: TextStyle(color: FixedColors.grey),
              )),
              InkWell(
                onTap: () {},
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
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.check_box_outline_blank_outlined,
                      color: FixedColors.grey,
                    ),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'I have read and agree with the',
                            style: TextStyle(
                                fontSize: 12,
                                color: FixedColors.grey,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              ' Terms & conditions,',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: FixedColors.purple,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Text(
                              'Privacy Policy',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: FixedColors.purple,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Text(
                            ' & ',
                            style: TextStyle(
                                fontSize: 12,
                                color: FixedColors.grey,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              'End User License Agreement ',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: FixedColors.purple,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SellerDetail()));
                },
                child: Center(
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
                        'Register',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
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
    );
  }
}
