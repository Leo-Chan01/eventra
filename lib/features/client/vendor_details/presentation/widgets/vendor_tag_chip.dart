import 'package:eventra/core/utils/num_extensions.dart';
import 'package:flutter/material.dart';

class VendorTagChip extends StatelessWidget {
  const VendorTagChip({
    required this.label,
    required this.isLastItem,
    super.key,
  });

  final String label;
  final bool isLastItem;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface.withValues(alpha: 0.85),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        children: [
          Text(
            label,
            style: 11.w500.copyWith(color: colorScheme.onSurface),
          ),
          if (!isLastItem) ...[
            Text(', ', style: 11.w500.copyWith(color: colorScheme.onSurface)),
          ],
        ],
      ),
    );
  }
}
