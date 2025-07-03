import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../values.dart';
import '../../../widgets/basic_button.dart';
import '../../../widgets/onboarding_mode_page.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {

  final pages = [
    OnboardingPageModel(
      title: "Votre carnet vaccinal numérique sécurisé",
      description: "Enregistrez, protégez et vérifiez vos certificats et ordonnances. Réservez vos rendez-vous et payez vos vaccins en toute confiance.",
      image: "assets/images/onboarding1.jpg",
    ),
    OnboardingPageModel(
      title: "Votre santé, votre contrôle",
      description: "Créez votre identité cryptographique, prenez vos rendez-vous et gérez vos paiements facilement, même sans connexion permanente.",
      image: "assets/images/onboarding2.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            flex: 8,
            child: PageView.builder(
              controller: controller.pageController,
              itemCount: pages.length,
              onPageChanged: (index) => controller.currentPage.value = index,
              itemBuilder: (context, index) {
                final page = pages[index];
                return Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(page.image, height: 300),
                      SizedBox(height: 32),
                      Text(page.title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),textAlign: TextAlign.center),
                      SizedBox(height: 16),
                      Text(page.description, textAlign: TextAlign.center),
                    ],
                  ),
                );
              },
            ),
          ),
          Expanded(
            flex: 2,
            child: Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(pages.length, (index) {
                return Container(
                  margin: EdgeInsets.all(4),
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: controller.currentPage.value == index ? Colors.blue : Colors.grey,
                  ),
                );
              }),
            )),
          ),
          Obx(() => Container(
            margin: EdgeInsets.only(bottom: 50),
            child: Center(
              child: BasicButton(
                  buttonText: controller.currentPage.value == pages.length - 1 ? "Terminer" : "Suivant",
                  buttonColor: themeBlue,
                  onPressed: controller.nextPage
              ),
            ),
          )),
        ],
      ),
    );
  }
}
