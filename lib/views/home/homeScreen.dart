import 'package:blogapp/views/home/homeController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: DefaultTabController(
          length: 1,
          initialIndex: 0,
          child: Column(
            children: [
              Expanded(flex: 35, child: homeScreenLayoutFirst),
              Expanded(flex: 65, child: homeScreenLayoutSecond)
            ],
          ),
        ));
  }
}

LayoutBuilder get homeScreenLayoutFirst {
  return LayoutBuilder(
      builder: (context, constrains) => Container(
            height: Get.height,
            width: Get.width,
            color: Colors.blue,
            child:  Center(child: Text('haha')),
          ));
}

LayoutBuilder get homeScreenLayoutSecond {
  return LayoutBuilder(
    builder: (context, constrains) => TabBarView(
      children: [
        layoutFirst(constrains),
//        layoutSecond(constrains),
      ],
    ),
  );
}

layoutFirst(BoxConstraints constrains) {
  return Column(
    children: [
      SizedBox(
        height: constrains.maxHeight * .03,
      ),
      Expanded(child: firstTab(constrains)),
      SizedBox(
        height: constrains.maxHeight * .03,
      ),
      Expanded(child: firstTab(constrains)), SizedBox(
        height: constrains.maxHeight * .03,
      ),
      Expanded(child: firstTab(constrains)),
      SizedBox(
        height: constrains.maxHeight * .03,
      ),
    ],
  );
}

firstTab(BoxConstraints constrains) {
  return Container(color: Colors.green,
    width: Get.width-constrains.maxWidth*.05,
    height: constrains.maxHeight*.040,
    child: Center(child: Text(' Second layout First Tab ')),
  );
}
