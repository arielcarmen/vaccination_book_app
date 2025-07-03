import 'package:get/get.dart';
import 'package:vaccination_book_app/app/modules/qr_code/controllers/qr_code_controller.dart';
import 'package:vaccination_book_app/app/modules/vaccins/controllers/vaccins_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );

    Get.lazyPut<VaccinsController>(
          () => VaccinsController(),
    );

    Get.lazyPut<QrCodeController>(
          () => QrCodeController(),
    );
  }
}
