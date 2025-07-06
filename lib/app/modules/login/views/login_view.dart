import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vaccination_book_app/app/values.dart';
import 'package:vaccination_book_app/app/widgets/basic_button.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connexion'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 64.0),
            TextField(
              controller: controller.npiController,
              decoration: const InputDecoration(
                labelText: 'NPI',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: controller.passwordController,
              decoration: const InputDecoration(
                labelText: 'Mot de passe',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 24.0),
            Obx((){
              return controller.isLoading.value == false
                  ? BasicButton(buttonText: 'Se connecter', buttonColor: themeBlue, onPressed: controller.login)
                  : CircularProgressIndicator();
            })
          ],
        ),
      ),
    );
  }
}
