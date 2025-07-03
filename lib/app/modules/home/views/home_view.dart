import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vaccination_book_app/app/modules/profile/views/profile_view.dart';
import 'package:vaccination_book_app/app/modules/qr_code/views/qr_code_view.dart';
import 'package:vaccination_book_app/app/modules/vaccins/views/vaccins_view.dart';

import '../../../controllers/navigation_controller.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final NavigationController _navController = Get.put(NavigationController());

  final List<Widget> _pages = [
    VaccinsView(),
    QrCodeView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => _pages[_navController.currentIndex.value]),
      bottomNavigationBar: _buildBottomNavBar(),
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
          label: 'Mes vaccins',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.qr_code_scanner),
          label: 'Qr',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profil',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Paramètres',
        ),
      ],
    ));
  }
}
