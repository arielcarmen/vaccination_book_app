import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:vaccination_book_app/app/modules/profile/views/profile_view.dart';
import 'package:vaccination_book_app/app/modules/qr_code/views/qr_code_view.dart';
import 'package:vaccination_book_app/app/modules/rdv/views/rdv_view.dart';
import 'package:vaccination_book_app/app/modules/vaccins/views/vaccins_view.dart';
import 'package:vaccination_book_app/app/modules/welcome/views/welcome_view.dart';
import 'package:vaccination_book_app/app/services/encoding_service.dart';
import 'package:vaccination_book_app/app/values.dart';

import '../../../controllers/navigation_controller.dart';
import '../../../widgets/qr_scanner_frame.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final NavigationController _navController = Get.put(NavigationController());

  final List<Widget> _pages = [
    WelcomeView(),
    VaccinsView(),
    RdvView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => _pages[_navController.currentIndex.value]),
      bottomNavigationBar: _buildBottomNavBar(),
      floatingActionButton: Transform.translate(
        offset: Offset(0, -16),
        child: FloatingActionButton(
          onPressed: () {
            var hidden = chiffrementSimple(controller.npi, hidk);
            Get.defaultDialog(
                title: "Voici mon carnet",
                contentPadding: EdgeInsets.all(16.0),
                content: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: PrettyQrView.data(data: hidden),
                    )
                ),
            );
          },
          backgroundColor: Colors.blue,
          elevation: 5,
          child: Icon(Icons.qr_code_scanner, size: 30, color: Colors.white,),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
    );
  }

  Widget _buildBottomNavBar() {
    return Obx(() => BottomNavigationBar(
      currentIndex: _navController.currentIndex.value,
      onTap: _navController.changePage,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: TextStyle(fontSize: 12),
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Accueil',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.vaccines),
          label: 'Mes vaccins',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          label: 'Rendez-Vous',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profil',
        ),
      ],
    ));

  }
}
