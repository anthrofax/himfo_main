import 'package:get/get.dart';

import '../controllers/anonymous_chat_controller.dart';

class AnonymousChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AnonymousChatController>(
      () => AnonymousChatController(),
    );
  }
}
