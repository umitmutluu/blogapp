import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PresenterController extends GetxController{

  PageController? pageController;
RxInt currentIndex=0.obs;

  @override
  void onInit() {
pageController=PageController();
super.onInit();
  }
  @override
  void onReady() {
pageController!.dispose();
    super.onReady();
  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}