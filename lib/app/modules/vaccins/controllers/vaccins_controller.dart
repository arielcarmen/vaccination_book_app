import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:vaccination_book_app/app/services/ApiService.dart';

class VaccinsController extends GetxController {
  ApiService api = ApiService('http://0.0.0.0:8000');
  final vaccinations = <Vaccination>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchVaccinations();
  }

  void fetchVaccinations() async {
    var vaccinationsRef = FirebaseFirestore.instance.collection('vaccinations');
    var snapshot = await vaccinationsRef.get();
    var vaccinationList = snapshot.docs.map((doc) => Vaccination.fromFirestore(doc)).toList();
    vaccinations.value = vaccinationList;
  }
}

class Vaccination {
  final String id;
  final String name;
  final String date;

  Vaccination({required this.id, required this.name, required this.date});

  factory Vaccination.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return Vaccination(
      id: doc.id,
      name: data['name'] ?? '',
      date: data['date'] ?? '',
    );
  }
}


