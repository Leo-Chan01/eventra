import 'package:eventra/core/utils/num_extensions.dart';
import 'package:flutter/material.dart';

class VendorTagChip extends StatelessWidget {
  const VendorTagChip({required this.label, super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: colorScheme.surface.withValues(alpha: 0.85),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: 11.w500.copyWith(color: colorScheme.onSurface),
      ),
    );
  }
}
