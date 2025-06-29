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
        title: Text('profile_choice'.tr),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            BasicButton(
              buttonText: 'patient',
              buttonColor: Colors.blue,
              page: 'login'
            ),
            SizedBox(
              height: 20,
            ),
            BasicButton(
                buttonText: 'controller',
                buttonColor: Colors.orange,
                page: 'login'
            )
          ],
        )
      ),
    );
  }
}
