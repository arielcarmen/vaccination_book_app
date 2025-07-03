import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vaccination_book_app/app/values.dart';

import 'app/routes/app_pages.dart';
import 'app/services/firestore_service.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await Get.putAsync(() async => FirestoreService());

  String route = "/login";

  final prefs = await SharedPreferences.getInstance();
  String npi = prefs.getString('npi') ?? '';
  bool firstStart = prefs.getBool('first_start') ?? true;

  if (firstStart == true){
    route = "/onboarding";
  } else {
    if (npi.isNotEmpty){
      route = "/home";
    }
  }

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Lightning Vaccination Book",
      initialRoute: route,
      getPages: AppPages.routes,
      theme: ThemeData(
        useMaterial3: false,
          primaryColor: themeBlue,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: themeBlue,
            secondary: themeOrange,
          ),
          appBarTheme: AppBarTheme(
            backgroundColor: themeBlue,
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18
            )// Couleur barre d’applications
          ),
      )
    ),
  );
}
