import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vaccination_book_app/app/values.dart';
import 'package:vaccination_book_app/app/widgets/basic_button.dart';

import '../controllers/welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.notifications))
        ],
        title: Obx((){return Text(
          'Bonjour, ${controller.prenom.value}',
        );}),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 40),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
            SizedBox(height: 90,),
            BasicButton(buttonText: 'Mon carnet', onPressed: (){}, buttonColor: themeBlue),
            SizedBox(height: 20,),
            BasicButton(buttonText: 'Prendre un rendez-vous', onPressed: (){}, buttonColor: themeBlue),
          ],
        ),
      )
    );
  }
}
