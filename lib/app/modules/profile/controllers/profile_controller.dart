import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {

  final count = 0.obs;
  var nom = "".obs;
  var prenom = "".obs;
  var npi = "".obs;
  var email = "".obs;
  var telephone = "".obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    final prefs = await SharedPreferences.getInstance();
    nom.value = prefs.getString('nom') ?? '';
    prenom.value = prefs.getString('prenom') ?? '';
    telephone.value = prefs.getString('telephone') ?? '';
    email.value = prefs.getString('email') ?? '';
    npi.value = prefs.getString('npi') ?? '';
  }

  void logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('npi');
    prefs.remove('nom');
    prefs.remove('prenom');
    prefs.remove('telephone');
    prefs.remove('email');
    Get.offNamed('/login');
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
