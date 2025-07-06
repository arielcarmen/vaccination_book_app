import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vaccination_book_app/app/values.dart';
import 'package:vaccination_book_app/app/widgets/basic_button.dart';

import '../controllers/profiles_controller.dart';

class ProfilesView extends GetView<ProfilesController> {
  const ProfilesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choix de profil'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            BasicButton(buttonText: "CONTROLLEUR", buttonColor: themeBlue, onPressed: (){
              Get.toNamed('/pre-scan');
            }),
            SizedBox(
              height: 16,
            ),
            BasicButton(buttonText: "PATIENT", buttonColor: themeBlue, onPressed: (){
              Get.toNamed('/onboarding');
            })
          ],
        )
      ),
    );
  }
}
