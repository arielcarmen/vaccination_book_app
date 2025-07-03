import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vaccination_book_app/app/services/api_service.dart';

class LoginController extends GetxController {
  ApiService api = ApiService();
  final npiController = TextEditingController();
  final passwordController = TextEditingController();

  void login() {

    String npi = npiController.text.trim();
    String password = passwordController.text.trim();

    if (npi.isEmpty || password.isEmpty) {
      Get.snackbar('Erreur', 'Veuillez entrer votre NPI et votre mot de passe',backgroundColor: Colors.red, colorText: Colors.white);
    } else if (npi.length < 8) {
      Get.snackbar('Erreur', 'Le NPI doit contenir a moins 8 caractères',backgroundColor: Colors.red, colorText: Colors.white);
    } else {
      var data = {
        "npi": npi,
        "password": password
      };
      api.login('login', data);
    }
  }
}
