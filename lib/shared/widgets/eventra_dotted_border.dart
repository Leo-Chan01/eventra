import 'package:flutter/material.dart';

enum EventraDottedBorderType {
  roundedRect,
  circle,
}

class EventraDottedBorder extends StatelessWidget {
  const EventraDottedBorder({
    required this.child,
    super.key,
    this.color,
    this.strokeWidth = 1,
    this.dashLength = 6,
    this.gapLength = 4,
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
    this.padding = EdgeInsets.zero,
    this.type = EventraDottedBorderType.roundedRect,
  });

  final Widget child;
  final Color? color;
  final double strokeWidth;
  final double dashLength;
  final double gapLength;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry padding;
  final EventraDottedBorderType type;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return CustomPaint(
      painter: EventraDottedBorderPainter(
        color: color ?? colorScheme.outline,
        strokeWidth: strokeWidth,
        dashLength: dashLength,
        gapLength: gapLength,
        borderRadius: borderRadius,
        type: type,
      ),
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }
}

class EventraDottedBorderPainter extends CustomPainter {
  const EventraDottedBorderPainter({
    required this.color,
    required this.strokeWidth,
    required this.dashLength,
    required this.gapLength,
    required this.borderRadius,
    required this.type,
  });

  final Color color;
  final double strokeWidth;
  final double dashLength;
  final double gapLength;
  final BorderRadius borderRadius;
  final EventraDottedBorderType type;

  @override
  void paint(Canvas canvas, Size size) {
    if (size.width <= 0 || size.height <= 0) {
      return;
    }

    final inset = strokeWidth / 2;
    final rect = Rect.fromLTWH(
      inset,
      inset,
      size.width - strokeWidth,
      size.height - strokeWidth,
    );

    final borderPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final path = Path();

    if (type == EventraDottedBorderType.circle) {
      final radius = rect.shortestSide / 2;
      path.addOval(Rect.fromCircle(center: rect.center, radius: radius));
    } else {
      final rRect = borderRadius.toRRect(rect);
      path.addRRect(rRect);
    }

    for (final metric in path.computeMetrics()) {
      var distance = 0.0;
      while (distance < metric.length) {
        final end = distance + dashLength < metric.length
            ? distance + dashLength
            : metric.length;
        canvas.drawPath(metric.extractPath(distance, end), borderPaint);
        distance += dashLength + gapLength;
      }
    }
  }

  @override
  bool shouldRepaint(covariant EventraDottedBorderPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.dashLength != dashLength ||
        oldDelegate.gapLength != gapLength ||
        oldDelegate.borderRadius != borderRadius ||
        oldDelegate.type != type;
  }
}
