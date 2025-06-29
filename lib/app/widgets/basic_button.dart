import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BasicButton extends StatelessWidget {
  final String buttonText;
  final String page;
  final Color buttonColor;

  const BasicButton({super.key,
    required this.buttonText,
    required this.page,
    required this.buttonColor
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: ElevatedButton(
        onPressed: () {
          Get.toNamed(page);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)
          )
        ),
        child: Text(buttonText),
      ),
    );
  }
}
