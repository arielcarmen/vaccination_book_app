import 'package:get/get.dart';

import '../controllers/pre_scan_controller.dart';

class PreScanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PreScanController>(
      () => PreScanController(),
    );
  }
}
