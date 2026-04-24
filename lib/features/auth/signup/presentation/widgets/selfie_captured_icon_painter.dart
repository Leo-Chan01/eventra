import 'dart:math';

import 'package:flutter/material.dart';

class SelfieCapturedIconPainter extends CustomPainter {
  const SelfieCapturedIconPainter({
    required this.color,
    this.dashWidth = 6,
    this.dashSpace = 5,
    this.strokeWidth = 2.5,
  });

  final Color color;
  final double dashWidth;
  final double dashSpace;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;
    final circumference = 2 * pi * radius;
    final dashCount = circumference / (dashWidth + dashSpace);
    final anglePerDash = (dashWidth / circumference) * 2 * pi;
    final anglePerGap = (dashSpace / circumference) * 2 * pi;
    var startAngle = -pi / 2;

    for (var i = 0; i < dashCount; i++) {
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        anglePerDash,
        false,
        paint,
      );
      startAngle += anglePerDash + anglePerGap;
    }
  }

  @override
  bool shouldRepaint(SelfieCapturedIconPainter oldDelegate) =>
      oldDelegate.color != color ||
      oldDelegate.dashWidth != dashWidth ||
      oldDelegate.dashSpace != dashSpace ||
      oldDelegate.strokeWidth != strokeWidth;
}
