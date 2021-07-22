import 'package:blogapp/models/userModel.dart';
import 'package:blogapp/services/primaryApiService.dart';
import 'package:blogapp/views/presenter/presenterScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class RegisterController extends GetxController {
  final PrimaryApiService primaryApiService = Get.put(PrimaryApiService());
  final picker=ImagePicker();
  RxString profileFile = ''.obs;
  TextEditingController name = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void selectPhotoFromGalerry() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileFile = pickedFile.path.obs;
      update();
    }
  }

  void takePhoto() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    if (pickedFile != null) {
      profileFile = pickedFile.path.obs;
      update();
    }

  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onInit() {
    super.onInit();
  }

  void login() {
    Get.off(PresenterScreen());
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void geriDon() {
    Get.delete<RegisterController>();
    Get.back();
  }

//todo email gönderilecek ve kayıt olunacak aktiflik false olacak

  Future<void> createUserAndLogin() async {
    if (name.text.isNotEmpty &&
        username.text.isNotEmpty &&
        email.text.isNotEmpty &&
        password.text.isNotEmpty) {
      var sonuc =
          await createUser(name.text, username.text, email.text, password.text);
      print('bakbura ${sonuc.name}');
      Get.off(PresenterScreen());
    } else
      Get.snackbar('title'.tr, 'boşBırakma'.tr,
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.teal,
          forwardAnimationCurve: Curves.elasticOut);
  }

  Future<User> createUser(
      String name, String username, String email, String password) async {
    final _response = await primaryApiService.postMethods("/api/users/create", {
      'name': name,
      'username': username,
      'email': email,
      'password': password,
    });

    var responser= User.fromJson(_response);
    print(responser);
    return responser;
  }
}
