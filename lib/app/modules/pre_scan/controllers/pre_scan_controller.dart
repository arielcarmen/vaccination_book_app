import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PreScanController extends GetxController {
  //TODO: Implement PreScanController

  RxBool isLoading = false.obs;
  final String baseUrl = "https://python-lnd-connect-production.up.railway.app";

  Future<void> checkVaccins(Map<String, dynamic> data) async {
    isLoading.value = true;
    final response = await http.post(
      Uri.parse('$baseUrl/verify_vaccins'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );
    if (response.statusCode == 200) {
      List resultats = json.decode(response.body)['resultats'];
      bool conformite = json.decode(response.body)['conformite'];
      var user = json.decode(response.body)['user'];
      isLoading.value = false;
      Get.dialog(ConstrainedBox(
        constraints: BoxConstraints(maxHeight: 350),
        child: AlertDialog(
          title: Text("Résultats"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Text("Nom: ", style: TextStyle(fontWeight: FontWeight.bold),),
                  Text("${user['nom']  }  ${user['prenom']}")
                ],
              ),
              SizedBox(
                height: 8.0,
              ),
              Row(
                children: [
                  Text("NPI: ", style: TextStyle(fontWeight: FontWeight.bold),),
                  Text("${user['npi']}")
                ],
              ),
              SizedBox(
                height: 8.0,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(resultats.length, (index) {
                  var item = resultats[index];
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(item['vaccin'], style: TextStyle(fontWeight: FontWeight.bold),),
                      Row(
                        children: [
                          Text(item['message']),
                          item['ok'] ? Text('✅') : Text('❌'),
                        ],
                      ),
                    ],
                  );
                }),
              ),

              SizedBox(height: 20,),
              conformite ? Text(
                "Vaccins à jour !",
                textAlign: TextAlign.center, style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.green
              ),
              ) : Text(
                  "Vaccins non à jour !",
                  textAlign: TextAlign.center, style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red
              )
              )
            ],
          ),
        ),
      ));

    } else {
      isLoading.value = false;
      Get.snackbar('Echec', 'Impossible de vérifier les informations');
    }
  }

  void launchScan(){
    Get.toNamed('/scanner');
  }
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
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
