import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationController extends GetxController {
  final GlobalKey<FormState> registerKey = GlobalKey<FormState>();
  TextEditingController first_name_controller = TextEditingController();
  TextEditingController last_name_controller = TextEditingController();
  TextEditingController mobile_controller = TextEditingController();
  TextEditingController email_controller = TextEditingController();

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
}
