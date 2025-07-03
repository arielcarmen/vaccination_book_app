import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingController extends GetxController {
  var currentPage = 0.obs;
  final pageController = PageController();

  Future<void> nextPage() async {
    if (currentPage.value < 1) {
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.easeInOut);
    } else {
      final prefs = await SharedPreferences.getInstance();
      prefs.setBool('first_start', false);
    }
  }

  void skip() => finish();

  Future<void> finish() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('first_start', false);
    Get.offAllNamed('/home');
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
