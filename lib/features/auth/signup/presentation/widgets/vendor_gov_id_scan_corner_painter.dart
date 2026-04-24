import 'package:flutter/material.dart';

class VendorGovIdScanCornerPainter extends CustomPainter {
  const VendorGovIdScanCornerPainter({
    required this.color,
    required this.isTop,
    required this.isLeft,
  });

  final Color color;
  final bool isTop;
  final bool isLeft;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    final path = Path();

    if (isTop && isLeft) {
      path
        ..moveTo(0, size.height * 0.55)
        ..lineTo(0, 0)
        ..lineTo(size.width * 0.55, 0);
    } else if (isTop && !isLeft) {
      path
        ..moveTo(size.width * 0.45, 0)
        ..lineTo(size.width, 0)
        ..lineTo(size.width, size.height * 0.55);
    } else if (!isTop && isLeft) {
      path
        ..moveTo(0, size.height * 0.45)
        ..lineTo(0, size.height)
        ..lineTo(size.width * 0.55, size.height);
    } else {
      path
        ..moveTo(size.width * 0.45, size.height)
        ..lineTo(size.width, size.height)
        ..lineTo(size.width, size.height * 0.45);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(VendorGovIdScanCornerPainter oldDelegate) =>
      oldDelegate.color != color ||
      oldDelegate.isTop != isTop ||
      oldDelegate.isLeft != isLeft;
}
