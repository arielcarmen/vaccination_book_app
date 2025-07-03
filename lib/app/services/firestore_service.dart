import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class FirestoreService extends GetxService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Récupère toutes les vaccinations
  Future<List<Map<String, dynamic>>> getVaccinations(String npi) async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('vaccins')
          .where("npi", isEqualTo: npi)
          .get();
      return snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    } catch (e) {
      Get.snackbar("Erreur", e.toString());
      return [];
    }
  }

  // Récupère les vaccinations par vaccin (ex: "covid19")
  Future<List<Map<String, dynamic>>> getVaccinationsByVaccine(String vaccine) async {
    try {
      QuerySnapshot snapshot = await _firestore
          .collection('vaccinations')
          .where('vaccin', isEqualTo: vaccine)
          .get();
      return snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    } catch (e) {
      Get.snackbar("Erreur", "Impossible de filtrer les vaccinations");
      return [];
    }
  }
}