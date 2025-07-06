import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../values.dart';
import '../../../widgets/basic_button.dart';
import '../controllers/pre_scan_controller.dart';

class PreScanView extends GetView<PreScanController> {
  const PreScanView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(top: 40),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      'assets/images/welcome.jpg',
                      width: 300,
                      height: 230,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 24,),
                  Image.asset(
                    'assets/images/logo.png',
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 70,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Vaccins prioritaires: ', style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                      Text("Grippe, COVID-19")
                    ],
                  ),
                  SizedBox(height: 20,),
                  BasicButton(buttonText: 'Scanner', onPressed: (){
                    controller.launchScan();
                  }, buttonColor: themeBlue),
                  SizedBox(height: 20,),
                ],
              ),
            ),

            Obx((){
              return controller.isLoading.value ? Positioned.fill(
                child: Container(
                  color: Colors.grey.withOpacity(0.7),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ) : SizedBox();
            })
          ],
        )
    );
  }
}
