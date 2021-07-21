import 'package:blogapp/models/userModel.dart';
import 'package:blogapp/services/primaryApiService.dart';
import 'package:blogapp/views/presenter/presenterScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final PrimaryApiService primaryApiService = Get.put(PrimaryApiService());

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  Future<void> login() async {
    //todo buraya authmetodu gelecek token alınacak şifre kontrolu yapılacak
    Get.off(PresenterScreen());
  }

  Future<void> createUserAndLogin() async {
    if (username.text.isNotEmpty && password.text.isNotEmpty) {
      var sonuc =
          await loginMethod(username.text,password.text);
      print('hello $sonuc');

      //todo burada istersen header dan gelen token taydedilebilir
       Get.off(PresenterScreen());
    }
    Get.snackbar('title'.tr, 'boşBırakma'.tr,
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: Colors.teal,
        forwardAnimationCurve: Curves.elasticOut);

  }

Future<dynamic> loginMethod (String username,String password)async{

    try{
      final response = await primaryApiService.postMethods("/api/users/login",
          {
            "username":username,
            "password":password
          });

      var returnvalue=User.fromJson(response);
      print(returnvalue);
      return returnvalue;
    }catch(e){
      return print(e);
    }


}
}
