import 'package:blogapp/views/explore/exploreScreen.dart';
import 'package:blogapp/views/home/homeScreen.dart';
import 'package:blogapp/views/message/messageScreen.dart';
import 'package:blogapp/views/presenter/presenterController.dart';
import 'package:blogapp/views/profile/profileScreen.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/cupertino.dart';
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
          children: [
            HomeScreen(),
            ExploreScreen(),
            MessageScreen(),
            ProfileScreen()
          ],
        ),
      ),
      bottomNavigationBar: Obx(() => FancyBottomNavigation(
              tabs: [
                TabData(iconData: CupertinoIcons.home, title: 'Ana Sayfa'),
                TabData(
                    iconData: CupertinoIcons.sun_haze_fill, title: 'Paylaşım'),
                TabData(iconData: CupertinoIcons.envelope, title: 'Mesajlar'),
                TabData(iconData: CupertinoIcons.person_alt, title: 'Profil'),
              ],
              onTabChangedListener: (positionIndex) {
                controller.currentIndex.value = positionIndex;
                controller.pageController!.jumpToPage(positionIndex);
              })),
    );
  }
}
