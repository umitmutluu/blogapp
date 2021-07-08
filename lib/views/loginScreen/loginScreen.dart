import 'package:blogapp/utils/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'loginController.dart';

class LoginScreen extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, //todo kayarsa düzelt
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/images/blogApp.png',
              scale: 8,
            ),
            Text('title'.tr),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(hintText: 'username'),
                      controller: controller.usernameController,
                    ),
                    TextField(
                      decoration: InputDecoration(hintText: 'username'),
                      controller: controller.usernameController,
                    ),
                  ],
                ),
              ),
            ),
            MaterialButton(
              color: Colors.teal,
              minWidth: Get.width * .8,
              onPressed: () {
                controller.login();
              },
              child: Text(
                'login'.tr,
                style: TextStyle(color: Colors.white),
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Hesabınız Yokmu? ',
                  style: normalSiyah,
                ),
                GestureDetector(
                  child: Text(
                    'kayıt'.tr,
                    style: boldStyle,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
