import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/rdv_controller.dart';

class RdvView extends GetView<RdvController> {
  const RdvView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RdvView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'RdvView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
