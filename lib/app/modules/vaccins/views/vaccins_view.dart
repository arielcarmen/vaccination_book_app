import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../controllers/vaccins_controller.dart';

class VaccinsView extends GetView<VaccinsController> {
  const VaccinsView({super.key});

  String generateVaccinationData() {
    return "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: Colors.transparent,
        elevation: 0,leading: Container(),
      ),
      body: Obx(() {
        if (controller.vaccinations.isEmpty) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: controller.vaccinations.length,
            itemBuilder: (context, index) {
              var vaccination = controller.vaccinations[index];
              return ListTile(
                title: Text(vaccination.name),
                subtitle: Text(vaccination.date),
              );
            },
          );
        }
      }),
    );
  }
}
