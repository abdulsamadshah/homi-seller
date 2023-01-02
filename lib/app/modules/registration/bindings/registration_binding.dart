import 'package:get/get.dart';
import 'package:homlisellerapp/app/modules/registration/controllers/registration_controller.dart';



class RegistrationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegistrationController>(
      () => RegistrationController(),
    );
  }
}
