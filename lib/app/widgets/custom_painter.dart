// import 'package:flutter/material.dart';
// import 'package:qr_flutter/qr_flutter.dart';
//
// class QRPainter extends CustomPainter {
//   final QrCode qr;
//   final Color color;
//
//   QRPainter(this.qr, {this.color = Colors.black});
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     final double pixelSize = size.width / qr.moduleCount;
//
//     final paint = Paint()..color = color;
//
//     for (int x = 0; x < qr.moduleCount; x++) {
//       for (int y = 0; y < qr.moduleCount; y++) {
//         if (qr.D modules[y][x] ?? false) {
//           final rect = Rect.fromLTWH(x * pixelSize, y * pixelSize, pixelSize, pixelSize);
//           canvas.drawRect(rect, paint);
//         }
//       }
//     }
//   }
//
//   @override
//   bool shouldRepaint(covariant QRPainter oldDelegate) => false;
// }
