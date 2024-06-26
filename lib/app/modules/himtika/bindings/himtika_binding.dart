import 'package:get/get.dart';

import '../controllers/himtika_controller.dart';

class HimtikaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HimtikaController>(
      () => HimtikaController(),
    );
  }
}
