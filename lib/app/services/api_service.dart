import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  final String baseUrl = "https://python-lnd-connect-production.up.railway.app";

  Future<Map<String, dynamic>> get(String endpoint) async {
    final response = await http.get(Uri.parse('$baseUrl/$endpoint'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      Get.snackbar('Erreur', 'Echec de recupération du carnet');
      throw Exception('Failed to load data');
    }
  }

  Future<Map<String, dynamic>> post(String endpoint, Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse('$baseUrl/$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );
    if (response.statusCode == 201) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to post data');
    }
  }

  Future<void> login(String endpoint, Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse('$baseUrl/$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );
    if (response.statusCode == 201) {
      Get.snackbar('Succès', 'Connexion réussie');

      final SharedPreferences prefs = await SharedPreferences.getInstance();

// Save an integer value to 'counter' key.
      print(json.decode(response.body));
      var user = json.decode(response.body)['user'];
      await prefs.setString('npi', user['npi']);
      var role = user['role'];

      if (role == "controlleur"){
        Get.toNamed('scanner');
      } else {
        Get.toNamed('vaccins');
      }

      // return json.decode(response.body);
    } else {
      Get.snackbar('Echec', 'NPI ou Mot de passe incorrecte');
      // throw Exception('Failed to post data');
    }
  }

  Future<void> checksigns(String endpoint, Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse('$baseUrl/$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );
    if (response.statusCode == 201) {
      Get.snackbar('Succès', 'Infos recuperees');
      return json.decode(response.body);
    } else {
      Get.snackbar('Echec', 'NPI ou Mot de passe incorrecte');
      // throw Exception('Failed to post data');
    }
  }

  Future<Map<String, dynamic>> fetchVaccinationRecords(String endpoint, String npi) async {
    final response = await http.get(
      Uri.parse('$baseUrl/$endpoint?npi=$npi'),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load vaccination records');
    }
  }
}
