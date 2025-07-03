import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vaccination_book_app/app/services/api_service.dart';

import '../../../services/firestore_service.dart';

class VaccinsController extends GetxController with GetSingleTickerProviderStateMixin{
  final FirestoreService _firestoreService = Get.find();
  var vaccinations = <Map<String, dynamic>>[].obs;
  var vaccinationsExpired = <Map<String, dynamic>>[].obs;
  var vaccinationOngoing = <Map<String, dynamic>>[].obs;
  var isLoading = false.obs;
  var isLoadingExpired = false.obs;
  var isLoadingOngoing = false.obs;

  late TabController tabController;

  final today = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  @override
  void onInit() async{
    tabController = TabController(length: 3, vsync: this); // 3 onglets
    super.onInit();
    final prefs = await SharedPreferences.getInstance();
    String npi = prefs.getString('npi') ?? '';
    fetchVaccinations(npi);
  }



  Future<void> fetchVaccinations(String npi) async {
    isLoading(true);
    FirebaseFirestore.instance.collection('vaccins')
        .where("npi", isEqualTo: npi)
        .snapshots().listen((snapshot) {
      vaccinations.value =
          snapshot.docs.map((doc) {
            final data = doc.data();
            data['id'] = doc.id;
            return data;
          }).toList();
    });
    isLoading(false);
  }

  Future<void> fetchExpiredVaccinations(String npi) async {
    final todayTimestamp = Timestamp.fromDate(today);
    isLoadingExpired(true);
    FirebaseFirestore.instance.collection('vaccins')
        .where("date_expiration", isLessThan: todayTimestamp)
        .snapshots().listen((snapshot) {
      vaccinationsExpired.value =
          snapshot.docs.map((doc) {
            final data = doc.data();
            data['id'] = doc.id;
            return data;
          }).toList();
    });
    isLoading(false);
  }

  Future<void> fetchOngoingVaccinations(String npi) async {
    final todayTimestamp = Timestamp.fromDate(today);
    isLoadingOngoing(true);
    FirebaseFirestore.instance.collection('vaccins')
        .where("date_expiration", isGreaterThanOrEqualTo: todayTimestamp)
        .snapshots().listen((snapshot) {
      vaccinationOngoing.value =
          snapshot.docs.map((doc) {
            final data = doc.data();
            data['id'] = doc.id;
            return data;
          }).toList();
    });
    isLoadingOngoing(false);
  }

  Future<void> fetchVaccinationsByVaccine(String vaccine) async {
    isLoading(true);
    vaccinations.value = await _firestoreService.getVaccinationsByVaccine(vaccine);
    isLoading(false);
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
