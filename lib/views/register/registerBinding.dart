import 'package:blogapp/views/register/registerController.dart';
import 'package:get/get.dart';

class RegisterBinding extends Bindings{
  @override
  void dependencies() {
  Get.lazyPut<RegisterController>(() => RegisterController());
  }

}