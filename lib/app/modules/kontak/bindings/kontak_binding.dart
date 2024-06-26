import 'package:get/get.dart';

import '../controllers/kontak_controller.dart';

class KontakBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KontakController>(
      () => KontakController(),
    );
  }
}
