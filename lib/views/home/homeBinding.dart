import 'package:blogapp/views/home/homeController.dart';
import 'package:blogapp/views/presenter/presenterController.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
