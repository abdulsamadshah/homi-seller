import 'package:get/get.dart';
import 'package:homlisellerapp/app/View_Model/registration_controller.dart';



class RegistrationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegistrationController>(
      () => RegistrationController(),
    );
  }
}
