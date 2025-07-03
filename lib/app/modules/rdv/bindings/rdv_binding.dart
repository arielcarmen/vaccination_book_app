import 'package:get/get.dart';

import '../controllers/rdv_controller.dart';

class RdvBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RdvController>(
      () => RdvController(),
    );
  }
}
