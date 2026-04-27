import 'package:flutter/material.dart';

class SelfieOvalOverlayPainter extends CustomPainter {
  const SelfieOvalOverlayPainter({
    required this.ovalRect,
    required this.overlayColor,
  });

  final Rect ovalRect;
  final Color overlayColor;

  @override
  void paint(Canvas canvas, Size size) {
    final overlayPaint = Paint()..color = overlayColor;
    final clearPaint = Paint()..blendMode = BlendMode.clear;

    canvas
      ..saveLayer(Offset.zero & size, Paint())
      ..drawRect(Offset.zero & size, overlayPaint)
      ..drawOval(ovalRect, clearPaint)
      ..restore();
  }

  @override
  bool shouldRepaint(SelfieOvalOverlayPainter oldDelegate) =>
      oldDelegate.ovalRect != ovalRect ||
      oldDelegate.overlayColor != overlayColor;
}
