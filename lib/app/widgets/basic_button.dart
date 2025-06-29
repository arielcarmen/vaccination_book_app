import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BasicButton extends StatelessWidget {
  final String buttonText;
  final Widget page;
  final Color buttonColor;

  const BasicButton({super.key,
    required this.buttonText,
    required this.page,
    required this.buttonColor
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Get.to(page);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor
      ),
      child: Text(buttonText),
    );
  }
}
