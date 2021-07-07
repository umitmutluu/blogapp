import 'package:blogapp/routes/appPages.dart';
import 'package:blogapp/utils/translation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(debugShowCheckedModeBanner: false,
      translations: MyTranslation(),
      locale: Locale('tr'),
      title: 'title'.tr,
      getPages: AppPages.routes,
      initialRoute: AppPages.INITIAL,
    );
  }
}
