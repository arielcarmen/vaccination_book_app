import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:vaccination_book_app/app/modules/pre_scan/controllers/pre_scan_controller.dart';
import 'package:vaccination_book_app/app/services/api_service.dart';
import 'package:vaccination_book_app/app/services/encoding_service.dart';
import 'package:vaccination_book_app/app/values.dart';

class ScannerController extends GetxController {

  PreScanController preScanController = Get.find<PreScanController>();
  var scannedCode = ''.obs;

  void setCode(String code) {
    scannedCode.value = code;
  }

  void resetCode() {
    scannedCode.value = '';
  }

  void checkBook(var data){
    String npi = dechiffrementSimple(data, hidk);
    var body = {
      "vaccines_list": ["COVID-19","Grippe"],
      "npi": npi
    };
    preScanController.checkVaccins(body);
  }




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
