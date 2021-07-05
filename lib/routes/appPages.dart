import 'package:blogapp/views/presenter/presenterBinding.dart';
import 'package:blogapp/views/presenter/presenterController.dart';
import 'package:blogapp/views/presenter/presenterScreen.dart';
import 'package:get/get.dart';

part 'appRoutes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
        name: _Path.Home,
        page: () => PresenterScreen(),
        binding: PresenterBinding())
  ];
}
