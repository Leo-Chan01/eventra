import 'package:eventra/features/auth/signup/presentation/widgets/selfie_captured_icon_painter.dart';
import 'package:eventra/shared/theme/color_schemes.dart';
import 'package:flutter/material.dart';

class SelfieCapturedIcon extends StatelessWidget {
  const SelfieCapturedIcon({super.key});

  @override
  Widget build(BuildContext context) {
    const outerSize = 80.0;
    const innerSize = 60.0;
    const successColor = AppColorSchemes.success;

    return SizedBox(
      width: outerSize,
      height: outerSize,
      child: Stack(
        alignment: Alignment.center,
        children: [
          const CustomPaint(
            size: Size(outerSize, outerSize),
            painter: SelfieCapturedIconPainter(color: successColor),
          ),
          Container(
            width: innerSize,
            height: innerSize,
            decoration: const BoxDecoration(
              color: successColor,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.check,
              color: Colors.white,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }
}
