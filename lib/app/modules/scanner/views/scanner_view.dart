import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../../values.dart';
import '../../../widgets/basic_button.dart';
import '../controllers/scanner_controller.dart';

class ScannerView extends GetView<ScannerController> {

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: MobileScanner(
          controller:  MobileScannerController(
            detectionSpeed: DetectionSpeed.noDuplicates,
            returnImage:  true

          ),
          onDetect: (capture){
            Get.back();
            Get.snackbar("QR Trouvé!", "Traitement en cours...");
            final List<Barcode> barcodes = capture.barcodes;
            controller.checkBook(barcodes.first.rawValue);
          },
        )
        // Container(
        //   padding: EdgeInsets.only(top: 40),
        //   width: double.infinity,
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.start,
        //     mainAxisSize: MainAxisSize.max,
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     children: [
        //
        //       Image.asset(
        //         'assets/images/logo.png',
        //         width: 200,
        //         fit: BoxFit.cover,
        //       ),
        //       SizedBox(height: 90,),
        //
        //       // BasicButton(buttonText: 'Mon carnet', onPressed: (){
        //       //   controller.checkBook();
        //       // }, buttonColor: themeBlue),
        //     ],
        //   ),
        // )
    );
  }



}
