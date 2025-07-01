import 'package:get/get.dart';

import '../controllers/vaccins_controller.dart';

class VaccinsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VaccinsController>(
      () => VaccinsController(),
    );
  }
}
