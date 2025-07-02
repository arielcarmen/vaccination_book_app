import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScannerController extends GetxController {
  //TODO: Implement ScannerController

  var qrResult = ''.obs;

  void setQRResult(String result) {
    qrResult.value = result;
    Get.defaultDialog(
      title: "QR Code Scanned",
      middleText: "Scanned Result: $result",
      textConfirm: "OK",
      confirmTextColor: Colors.white,
      onConfirm: () {
        Get.back(); // Ferme le dialogue
      },
    );

  }
  }
