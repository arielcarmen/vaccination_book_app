import 'package:flutter/material.dart';

class QRScannerFrame extends StatelessWidget {
  const QRScannerFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Fond semi-transparent
        Container(
          color: Colors.black.withOpacity(0.5),
        ),
        // Cadre du scanner
        Center(
          child: Container(
            width: 250,
            height: 250,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.green,
                width: 4.0,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Coin supérieur gauche
                CustomPaint(
                  painter: CornerPainter(),
                  size: Size(50, 50),
                ),
                // Coin inférieur droit
                CustomPaint(
                  painter: CornerPainter(),
                  size: Size(50, 50),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CornerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.green
      ..strokeWidth = 4.0
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..moveTo(0, size.height / 2)
      ..lineTo(0, 0)
      ..lineTo(size.width / 2, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
