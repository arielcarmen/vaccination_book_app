import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../widgets/vaccination_card.dart';
import '../controllers/vaccins_controller.dart';

class VaccinsView extends GetView<VaccinsController> {
  const VaccinsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mes vaccination"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 24,),
          Container(
            padding: EdgeInsets.only(top: 8, left: 8, right: 8),
            decoration: BoxDecoration(
              color: Colors.grey[200],
            ),
            child: TabBar(
              controller: controller.tabController,
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.black,
              labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              indicator: BoxDecoration(
                border: Border(bottom: BorderSide(width: 2, color: Colors.blue)),
                // color: Colors.blueAccent,
              ),
                tabs: const [
                Tab(text: 'Tout'),
                Tab(text: 'En cours'),
                Tab(text: 'Expirés'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: controller.tabController,
              children: [
                Obx(() {
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
                Obx(() {
                  if (controller.isLoadingOngoing.value) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (controller.vaccinationOngoing.isEmpty) {
                    return const Center(child: Text("Aucune vaccination en cours de validité"));
                  }

                  return ListView.builder(
                    itemCount: controller.vaccinationOngoing.length,
                    itemBuilder: (context, index) {
                      return VaccinationCard(
                        vaccination: controller.vaccinationOngoing[index],
                      );
                    },
                  );
                }),
                Obx(() {
                  if (controller.isLoadingExpired.value) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (controller.vaccinationsExpired.isEmpty) {
                    return const Center(child: Text("Aucune vaccination expirée"));
                  }

                  return ListView.builder(
                    itemCount: controller.vaccinationsExpired.length,
                    itemBuilder: (context, index) {
                      return VaccinationCard(
                        vaccination: controller.vaccinationsExpired[index],
                      );
                    },
                  );
                }),
              ],
            ),
          ),

        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => controller.fetchVaccinationsByVaccine("covid19"),
      //   backgroundColor: Colors.blue,
      //   child: const Icon(Icons.filter_alt, color: Colors.white),
      // ),
    );
  }
}
