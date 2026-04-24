import 'dart:math' as math;

import 'package:flutter/material.dart';

class VendorKycLoadingIndicator extends StatefulWidget {
  const VendorKycLoadingIndicator({
    this.size = 24,
    this.strokeWidth = 6,
    super.key,
  });

  final double size;
  final double strokeWidth;

  @override
  State<VendorKycLoadingIndicator> createState() =>
      VendorKycLoadingIndicatorState();
}

class VendorKycLoadingIndicatorState extends State<VendorKycLoadingIndicator>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    return RepaintBoundary(
      child: SizedBox(
        width: widget.size,
        height: widget.size,
        child: AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return CustomPaint(
              painter: VendorKycLoadingPainter(
                color: color,
                strokeWidth: widget.strokeWidth,
                progress: controller.value,
              ),
            );
          },
        ),
      ),
    );
  }
}

class VendorKycLoadingPainter extends CustomPainter {
  const VendorKycLoadingPainter({
    required this.color,
    required this.strokeWidth,
    required this.progress,
  });

  final Color color;
  final double strokeWidth;
  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final rotationAngle = progress * math.pi * 2;
    final shader = SweepGradient(
      colors: [
        color.withValues(alpha: 0.0),
        color.withValues(alpha: 0.14),
        color.withValues(alpha: 0.32),
        color.withValues(alpha: 0.6),
        color,
      ],
      stops: const [0.0, 0.55, 0.74, 0.9, 1.0],
      startAngle: 0,
      endAngle: math.pi * 2,
      transform: GradientRotation(rotationAngle - (math.pi * 0.5)),
    ).createShader(rect);

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..shader = shader;

    canvas.drawCircle(
      rect.center,
      (size.shortestSide - strokeWidth) / 2,
      paint,
    );

    final ringRadius = (size.shortestSide - strokeWidth) / 2;
    final headAngle = rotationAngle - (math.pi * 0.5);
    final headOffset = Offset(
      math.cos(headAngle) * ringRadius,
      math.sin(headAngle) * ringRadius,
    );

    final headPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = color;

    canvas.drawCircle(
      rect.center + headOffset,
      strokeWidth / 2,
      headPaint,
    );
  }

  @override
  bool shouldRepaint(covariant VendorKycLoadingPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.progress != progress;
  }
}
