import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vaccination_book_app/app/controllers/navigation_controller.dart';
import 'package:vaccination_book_app/app/modules/home/controllers/home_controller.dart';
import 'package:vaccination_book_app/app/values.dart';
import 'package:vaccination_book_app/app/widgets/basic_button.dart';

import '../controllers/welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  WelcomeView({super.key});

  final navController = Get.find<NavigationController>();

  final List<String> images = [
    'assets/images/welcome.jpg',
    'assets/images/welcome.jpg',
    'assets/images/welcome.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(onPressed: (){}, icon: Badge(
            label: Text("3"),
              child: Icon(Icons.notifications))
          )
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
            CarouselSlider(
              options: CarouselOptions(
                height: 225,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                enlargeCenterPage: true,
                viewportFraction: 0.9,
              ),
              items: images.map((path) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(path, fit: BoxFit.cover, width: double.infinity),
                );
              }).toList(),
            ),
            SizedBox(height: 24,),
            Image.asset(
              'assets/images/logo.png',
              width: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 90,),
            BasicButton(buttonText: 'Mon carnet', onPressed: (){
              navController.changePage(1);
            }, buttonColor: themeBlue),
            SizedBox(height: 20,),
            BasicButton(buttonText: 'Prendre un rendez-vous', onPressed: (){
              Get.snackbar('Oops..', 'Pas encore implémenté',backgroundColor: Colors.red, colorText: Colors.white);;
            }, buttonColor: themeBlue),
          ],
        ),
      )
    );
  }
}
