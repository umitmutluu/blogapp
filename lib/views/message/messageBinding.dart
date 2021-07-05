import 'package:blogapp/views/message/messageController.dart';
import 'package:get/get.dart';

class MessageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MessageController>(() => MessageController());
  }
}
