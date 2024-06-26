import 'package:get/get.dart';

import '../controllers/vicode_controller.dart';

class VicodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VicodeController>(
      () => VicodeController(),
    );
  }
}
