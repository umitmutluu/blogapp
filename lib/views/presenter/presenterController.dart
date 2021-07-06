import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PresenterController extends GetxController{

  PageController? pageController;
RxInt currentIndex=0.obs;
  GlobalKey bottomNavigationKey=GlobalKey();

  @override
  void onInit() {
pageController=PageController();
super.onInit();
update();
  }
  @override
  void onReady() {
pageController!.dispose();
    super.onReady();
    update();
  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}