import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../controllers/scanner_controller.dart';

class ScannerView extends GetView<ScannerController> {
  const ScannerView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ScannerView'),
        centerTitle: true,
      ),
      body: Center(
        child: MobileScanner(
          controller: MobileScannerController(
            detectionSpeed: DetectionSpeed.noDuplicates,
            returnImage: true
          ),
          onDetect: (capture){
            final List<Barcode> barcodes = capture.barcodes;
            final Uint8List? image = capture.image;
            for (final barcode in barcodes){
              print('Barcode! ${barcode.rawValue}');
            }

            if (image != null){
              Get.defaultDialog(
                title: barcodes.first.rawValue ?? "",
                content: Image(image: MemoryImage(image))
              );
            }
          },
        )
      ),
    );
  }
}
