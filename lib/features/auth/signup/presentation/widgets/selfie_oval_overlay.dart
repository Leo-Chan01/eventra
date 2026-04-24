import 'package:eventra/features/auth/signup/presentation/widgets/selfie_oval_overlay_painter.dart';
import 'package:flutter/material.dart';

class SelfieOvalOverlay extends StatelessWidget {
  const SelfieOvalOverlay({
    required this.onTap,
    required this.moveCloserLabel,
    required this.overlayColor,
    required this.labelColor,
    super.key,
  });

  final VoidCallback onTap;
  final String moveCloserLabel;
  final Color overlayColor;
  final Color labelColor;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;
        final ovalWidth = width * 0.72;
        final ovalHeight = ovalWidth * 1.25;
        final left = (width - ovalWidth) / 2;
        final top = (height - ovalHeight) / 2 - 40;
        final ovalRect = Rect.fromLTWH(left, top, ovalWidth, ovalHeight);

        return GestureDetector(
          onTap: onTap,
          child: Stack(
            fit: StackFit.expand,
            children: [
              CustomPaint(
                painter: SelfieOvalOverlayPainter(
                  ovalRect: ovalRect,
                  overlayColor: overlayColor,
                ),
              ),
              Positioned(
                top: top + ovalHeight + 20,
                left: 0,
                right: 0,
                child: Text(
                  moveCloserLabel,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: labelColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
