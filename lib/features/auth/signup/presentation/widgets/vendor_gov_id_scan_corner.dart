import 'package:eventra/features/auth/signup/presentation/widgets/vendor_gov_id_scan_corner_painter.dart';
import 'package:flutter/material.dart';

class VendorGovIdScanCorner extends StatelessWidget {
  const VendorGovIdScanCorner({
    required this.isTop,
    required this.isLeft,
    super.key,
  });

  final bool isTop;
  final bool isLeft;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      width: 62,
      height: 62,
      child: CustomPaint(
        painter: VendorGovIdScanCornerPainter(
          color: colorScheme.primary,
          isTop: isTop,
          isLeft: isLeft,
        ),
      ),
    );
  }
}
