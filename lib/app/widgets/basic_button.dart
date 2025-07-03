import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BasicButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final VoidCallback onPressed;

  const BasicButton({super.key,
    required this.buttonText,
    required this.buttonColor, required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsGeometry.symmetric(horizontal: 26),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0)
            )
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Text(
                buttonText.tr,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16
              ),
            ),
          ),
        ),
      ),
    );
  }
}
