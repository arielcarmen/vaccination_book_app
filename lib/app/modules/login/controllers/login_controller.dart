import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vaccination_book_app/app/services/api_service.dart';

class LoginController extends GetxController {
  RxBool isLoading = false.obs;
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
      isLoading.value = true;
      login2('login', data);
    }
  }
  final String baseUrl = "https://python-lnd-connect-production.up.railway.app";


  Future<void> login2(String endpoint, Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse('$baseUrl/$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );
    if (response.statusCode == 201) {
      Get.snackbar('Succès', 'Connexion réussie',backgroundColor: Colors.green, colorText: Colors.white);

      final SharedPreferences prefs = await SharedPreferences.getInstance();

      var user = json.decode(response.body)['user'];

      var role = user['role'];
      var nom = user['nom'];
      var prenom = user['prenom'];
      var email = user['email'];
      var telephone = user['telephone'];

      await prefs.setString('npi', user['npi']);
      await prefs.setString('nom', nom);
      await prefs.setString('prenom', prenom);
      await prefs.setString('email', email);
      await prefs.setString('telephone', telephone);

      isLoading.value = false;

      if (role == "controlleur"){
        Get.offNamed('/scanner');
      } else {
        prefs.setBool('first_start', false);
        Get.offNamed('/home');
      }

    } else {
      isLoading.value = false;
      Get.snackbar('Echec', 'NPI ou Mot de passe incorrecte',backgroundColor: Colors.red, colorText: Colors.white);
      // throw Exception('Failed to post data');
    }
  }
}
