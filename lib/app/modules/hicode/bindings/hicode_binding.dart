import 'package:get/get.dart';

import '../controllers/hicode_controller.dart';

class HicodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HicodeController>(
      () => HicodeController(),
    );
  }
}
