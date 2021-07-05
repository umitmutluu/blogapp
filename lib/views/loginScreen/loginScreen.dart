import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'loginController.dart';

class LoginScreen extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return GetX<LoginController>(
        builder: (controller) => Scaffold(
              backgroundColor: Colors.white,
              body: SafeArea(
                child: Container(
                  height: Get.height,
                  width: Get.width,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Card(
                          child: Column(
                            children: [
                              TextField(
                                decoration:
                                    InputDecoration(hintText: 'username'),
                                controller: controller.usernameController,
                              ),
                              TextField(
                                decoration:
                                    InputDecoration(hintText: 'username'),
                                controller: controller.usernameController,
                              ),
                              FractionallySizedBox(
                                widthFactor: .04,
                                heightFactor: 0.6,
                                child: MaterialButton(
                                  onPressed: () {},
                                  child: Text('Giriş Yap'),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }
}
