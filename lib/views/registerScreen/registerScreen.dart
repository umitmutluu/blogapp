import 'dart:io';

import 'package:blogapp/utils/assetPaths.dart';
import 'package:blogapp/utils/textStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'registerController.dart';

class RegisterScreen extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(blogAppLogo),
            RegisterWidget(controller: controller),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('zatenVar'.tr, style: TextStyle(color: Colors.black)),
                  GestureDetector(
                    onTap: () => controller.geriDon(),
                    child:
                        Text('login'.tr, style: TextStyle(color: Colors.blue)),
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

class RegisterWidget extends StatelessWidget {
  final RegisterController controller;

  RegisterWidget({required this.controller});

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
          GestureDetector(
            onTap: () {
             showModalBottomSheet(context: context, builder:
                 (context)
             =>Container(decoration: BoxDecoration(color: Colors.white,
                 borderRadius: BorderRadius.circular(10.0)),  child: Column(
               mainAxisSize: MainAxisSize.min,
               children: [
                 GestureDetector(
                   onTap:(){
                     controller.selectPhotoFromGalerry();
                   },
                   child: Text(
                     'gallery'.tr,
                     style: TextStyle(
                       color: Color(0xFF6057a8),
                       fontSize: Get.width * .07,
                       fontWeight: FontWeight.bold,
                     ),
                   ),
                 ),
                 SizedBox(height: 8),
                 Visibility(
                   child: GestureDetector(
                     onTap: (){
                       controller.takePhoto();
                     },
                     child: Text(
                       'takephoto'.tr,
                       style: TextStyle(
                         color: Color(0xFF6057a8),
                         fontSize: Get.width * .07,
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                   ),
                 ),
               ],
             ),));
            },
            child: Center(
              child: controller.profileFile.value == ""
                  ? Container(
height: Get.width*.4,width: Get.height*.2,decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.black,
                    width:  3 ),
                shape: BoxShape.circle,
              ),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: CircleAvatar(
                          radius: Get.width * 0.15,
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage(addPerson)),
                    ),
                  )
                  : Container(
                height: Get.width*.4,width: Get.height*.2,decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.black,
                    width:  3 ),
                shape: BoxShape.circle,
              ),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: CircleAvatar(radius: Get.width*0.15,
                          backgroundColor: Colors.white,
                          backgroundImage:
                              FileImage(File(controller.profileFile.value)),
                        ),
                    ),
                  ),
            ),
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
                    controller: controller.name,
                    decoration: InputDecoration(
                        icon: Icon(Icons.person),
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        hintText: "name".tr),
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
                    controller: controller.username,
                    decoration: InputDecoration(
                        icon: Icon(Icons.person),
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
                    keyboardType: TextInputType.emailAddress,
                    controller: controller.email,
                    decoration: InputDecoration(
                        icon: Icon(Icons.email_outlined),
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        hintText: "email".tr),
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
              child: MaterialButton(
                minWidth: Get.width / 2,
                onPressed: () => controller.createUserAndLogin(),
                color: Colors.teal,
                child: Text(
                  'kayıt'.tr,
                  style: normalBeyaz,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
