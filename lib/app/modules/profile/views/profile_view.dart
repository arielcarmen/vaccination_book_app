import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../widgets/basic_button.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mon Profil'), centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
            ),
            SizedBox(height: 20),
            Obx((){
              return Text('${controller.nom.value} ${controller.prenom.value}', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold));
            }),
            SizedBox(height: 10),
            Obx((){
              return Text(controller.email.value);
            }),
            Divider(height: 40),
            ListTile(
              leading: Icon(Icons.badge, color: Colors.blue),
              title: Text('Informations personnelles'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              leading: Icon(Icons.calendar_month, color: Colors.blue),
              title: Text('Mes rendez-vous'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              leading: Icon(Icons.security, color: Colors.blue),
              title: Text('Sécurité'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            SizedBox(height: 16,),
            Align(
              alignment: Alignment.bottomCenter,
                child: BasicButton(buttonText: 'Déconnexion', onPressed: controller.logout, buttonColor: Colors.red
                )
            ),
          ],
        ),
      ),
    );
  }
}
