import 'package:eventra/core/utils/num_extensions.dart';
import 'package:flutter/material.dart';

class VendorQuickStatColumn extends StatelessWidget {
  const VendorQuickStatColumn({
    required this.value,
    required this.label,
    this.extra,
    super.key,
  });

  final String value;
  final String label;
  final String? extra;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AspectRatio(
      aspectRatio: 3 / 2,
      child: Column(
        children: [
          Text(
            value,
            style: 20.w700.copyWith(color: colorScheme.onSurface),
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Text(
              label,
              style: 12.w500.copyWith(
                color: colorScheme.onSurfaceVariant,
                height: 1.25,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          if (extra != null) ...[
            2.vertSpacing,
            Text(
              extra!,
              style: 12.w500.copyWith(color: colorScheme.onSurfaceVariant),
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }
}
