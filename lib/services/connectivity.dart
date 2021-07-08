import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';

class ConnectivityService extends GetxController {
  @override
  void onInit() {
    startSubscriction();
    super.onInit();
  }

  void startSubscriction() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        print('bağlantıYanlış'.tr);
      } else if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        print('bağlantıDoğru'.tr);
      }
    });
  }
}
