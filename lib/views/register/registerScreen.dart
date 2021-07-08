import 'package:blogapp/views/register/registerController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends GetView<RegisterController> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Expanded(flex: 80, child: emailField),
            Expanded(flex: 80, child: backForward),
          ],
        ),
      ),
    );
  }
}



get emailField => null;



get backForward => null;