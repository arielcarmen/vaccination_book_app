import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/vaccins_controller.dart';

class VaccinsView extends GetView<VaccinsController> {
  const VaccinsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VaccinsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'VaccinsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
