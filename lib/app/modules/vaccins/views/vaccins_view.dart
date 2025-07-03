import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../widgets/vaccination_card.dart';
import '../controllers/vaccins_controller.dart';

class VaccinsView extends GetView<VaccinsController> {
  const VaccinsView({super.key});

  String generateVaccinationData() {
    return "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mes Certificats de Vaccination"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.vaccinations.isEmpty) {
          return const Center(child: Text("Aucune vaccination enregistrée"));
        }

        return ListView.builder(
          itemCount: controller.vaccinations.length,
          itemBuilder: (context, index) {
            return VaccinationCard(
              vaccination: controller.vaccinations[index],
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.fetchVaccinationsByVaccine("covid19"),
        backgroundColor: Colors.blue,
        child: const Icon(Icons.filter_alt, color: Colors.white),
      ),
    );
  }
}
