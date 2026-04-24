import 'package:flutter/material.dart';

class VendorKycPinIndicatorRow extends StatelessWidget {
  const VendorKycPinIndicatorRow({
    required this.filledCount,
    super.key,
  });

  final int filledCount;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (index) {
        final isFilled = index < filledCount;
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          width: 18,
          height: 18,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isFilled
                ? colorScheme.primary
                : colorScheme.surface.withValues(alpha: 0.08),
            border: Border.all(
              color: colorScheme.outline.withValues(alpha: 0.4),
            ),
          ),
        );
      }),
    );
  }
}
