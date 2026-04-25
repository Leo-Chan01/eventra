import 'package:eventra/core/utils/num_extensions.dart';
import 'package:flutter/material.dart';

class VendorTransactionPinKey extends StatelessWidget {
  const VendorTransactionPinKey({
    required this.digit,
    required this.letters,
    required this.onTap,
    super.key,
  });

  final String digit;
  final String letters;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 118,
        height: 76,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              digit,
              style: 22.w500.copyWith(color: colorScheme.onSurface),
            ),
            if (letters.isNotEmpty)
              Text(
                letters,
                style: 14.w700.copyWith(color: colorScheme.onSurface),
              ),
          ],
        ),
      ),
    );
  }
}
