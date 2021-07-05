import 'package:blogapp/views/presenter/presenterController.dart';
import 'package:get/get.dart';

import 'exploreController.dart';

class ExploreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExploreController>(() => ExploreController());
  }
}
