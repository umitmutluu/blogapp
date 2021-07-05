import 'package:blogapp/views/presenter/presenterController.dart';
import 'package:get/get.dart';

class PresenterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PresenterController>(() => PresenterController());
  }
}
