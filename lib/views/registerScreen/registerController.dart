import 'package:blogapp/views/presenter/presenterScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController{


  TextEditingController name =TextEditingController();
  TextEditingController username =TextEditingController();
  TextEditingController email =TextEditingController();
  TextEditingController password =TextEditingController();
 RxBool isLogin=true.obs;

 Future<void>changeDisplay()async {
  isLogin.value=!isLogin.value;
}
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


  void login(){
    Get.off(PresenterScreen());
  }



  void sendEmailAndLogin(){
    if(email.text.isEmpty){
      Get.snackbar('title'.tr, 'boşBırakma'.tr);
    }else{
//todo email gönderilecek ve kayıt olunacak aktiflik false olacak
    }
  }


}