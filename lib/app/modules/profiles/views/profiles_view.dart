import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vaccination_book_app/app/widgets/basic_button.dart';

import '../controllers/profiles_controller.dart';

class ProfilesView extends GetView<ProfilesController> {
  const ProfilesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfilesView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Column(
          children: [
            BasicButton(
              buttonText: 'patient'.tr,
              buttonColor: Colors.blue,
              page: 'login'
            )
          ],
        )
      ),
    );
  }
}
