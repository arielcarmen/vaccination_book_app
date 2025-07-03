import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:vaccination_book_app/app/services/api_service.dart';

import '../../../services/firestore_service.dart';

class VaccinsController extends GetxController {
  final FirestoreService _firestoreService = Get.find();
  var vaccinations = <Map<String, dynamic>>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    fetchVaccinations();
    super.onInit();
  }

  Future<void> fetchVaccinations() async {
    isLoading(true);
    vaccinations.value = await _firestoreService.getVaccinations();
    isLoading(false);
  }

  Future<void> fetchVaccinationsByVaccine(String vaccine) async {
    isLoading(true);
    vaccinations.value = await _firestoreService.getVaccinationsByVaccine(vaccine);
    isLoading(false);
  }
}
