import 'package:blogapp/services/center_api.dart';
import 'package:blogapp/views/presenter/presenterScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final centerApi =Get.put(CenterApi());
  TextEditingController name = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  RxBool isLogin = true.obs;
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onInit() {
    super.onInit();
  }

  void login() {
    Get.off(PresenterScreen());
  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

void geriDon(){
    Get.delete<RegisterController>();
    Get.back();
}


//todo email gönderilecek ve kayıt olunacak aktiflik false olacak

  Future<void> createUserAndLogin() async {
    if (name.text.isNotEmpty && username.text.isNotEmpty && email.text
        .isNotEmpty && password.text.isNotEmpty) {
      var response= await centerApi.createUser(name.text, username.text, email
          .text, password.text);
      print(response);
      Get.off(PresenterScreen());
    }else
      Get.snackbar('title'.tr, 'boşBırakma'.tr,snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.teal,
          forwardAnimationCurve: Curves.elasticOut);
  }
}
