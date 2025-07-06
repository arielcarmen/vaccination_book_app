import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  RxString npi = "".obs;

  final count = 0.obs;
  @override
  Future<void> onInit() async {
    super.onInit();
    final prefs = await SharedPreferences.getInstance();
    npi.value = prefs.getString('npi') ?? '';
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
