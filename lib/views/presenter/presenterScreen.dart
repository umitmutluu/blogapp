import 'package:blogapp/views/presenter/presenterController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PresenterScreen extends GetView<PresenterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox.expand(
        child: PageView(
          controller: controller.pageController,
        ),
      ),bottomNavigationBar: Obx(()=>Fancy),
    );
  }
}
