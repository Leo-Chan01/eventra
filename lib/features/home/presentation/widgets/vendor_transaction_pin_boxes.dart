import 'package:flutter/material.dart';

class VendorTransactionPinBoxes extends StatelessWidget {
  const VendorTransactionPinBoxes({
    required this.pinLength,
    super.key,
  });

  final int pinLength;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (index) {
        final isFilled = index < pinLength;
        return Container(
          width: 66,
          height: 66,
          margin: const EdgeInsets.symmetric(horizontal: 8),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: colorScheme.secondaryContainer,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isFilled
                  ? colorScheme.primary
                  : colorScheme.outline.withValues(alpha: 0.2),
              width: isFilled ? 1.6 : 1,
            ),
          ),
          child: isFilled
              ? Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: colorScheme.primary,
                    shape: BoxShape.circle,
                  ),
                )
              : null,
        );
      }),
    );
  }
}
