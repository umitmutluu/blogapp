import 'package:blogapp/utils/assetPaths.dart';
import 'package:blogapp/utils/textStyle.dart';
import 'package:blogapp/views/registerScreen/registerController.dart';
import 'package:blogapp/views/registerScreen/registerScreen.dart';
import 'package:blogapp/widgets/bottomTextWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'loginController.dart';

class LoginScreen extends GetView<LoginController>  {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(blogApp),
            LoginWidget(controller: controller),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('hesapAc'.tr,
                      style: TextStyle(color: Colors.black)),
                  GestureDetector(
                    onTap: () async{
                      Get.put(RegisterController());
                 Get.to(RegisterScreen(),transition: Transition.rightToLeftWithFade);
                    },
                    child: Text('olustur'.tr,
                        style: TextStyle(color: Colors.blue)),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}

class LoginWidget extends StatelessWidget {
  final LoginController controller;

  LoginWidget({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.5),
              blurRadius: 10,
            )
          ],
          borderRadius: BorderRadius.circular(20)),
      child: Wrap(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 1.2,
                margin: EdgeInsets.only(top: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.grey.withOpacity(.3),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: TextField(
                    controller: controller.username,
                    decoration: InputDecoration(
                        icon: Icon(Icons.email_outlined),
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        hintText: "username".tr),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 1.2,
                margin: EdgeInsets.only(top: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.grey.withOpacity(.3),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: TextField(
                    controller: controller.password,
                    decoration: InputDecoration(
                        icon: Icon(Icons.lock),
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        hintText: "password".tr),
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: Padding(
                padding: const EdgeInsets.all(25),
                child: MaterialButton(minWidth: Get.width/2,
                  onPressed: () =>controller.login(),
                  child: Text('login'.tr,style: normalBeyaz,),
                  color: Colors.teal,
                )),
          )
        ],
      ),
    );
  }
}


