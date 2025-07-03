import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeController extends GetxController {

  var prenom = "".obs;
  final count = 0.obs;
  @override
  void onInit() async{
    super.onInit();

    final prefs = await SharedPreferences.getInstance();
    prenom.value = prefs.getString('prenom') ?? '';
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
