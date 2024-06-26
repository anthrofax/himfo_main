import 'package:get/get.dart';

import '../controllers/proker_controller.dart';

class ProkerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProkerController>(
      () => ProkerController(),
    );
  }
}
