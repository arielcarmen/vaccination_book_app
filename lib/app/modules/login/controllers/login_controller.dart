import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:vaccination_book_app/app/services/ApiService.dart';

class LoginController extends GetxController {
  ApiService api = ApiService('http://10.21.246.179:8000');
  final npiController = TextEditingController();
  final passwordController = TextEditingController();

  void login() {
    String npi = npiController.text.trim();
    String password = passwordController.text.trim();

    if (npi.isEmpty || password.isEmpty) {
      Get.snackbar('Erreur', 'Veuillez entrer votre NPI et votre mot de passe');
    } else {
      var data = {
        "npi": npi,
        "password": password
      };
      api.login('login', data);
    }
  }
}
