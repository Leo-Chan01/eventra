import 'package:eventra/core/utils/num_extensions.dart';
import 'package:flutter/material.dart';

class VendorCompletedJobInfoRow extends StatelessWidget {
  const VendorCompletedJobInfoRow({
    required this.label,
    required this.value,
    this.isHighlightedValue = false,
    super.key,
  });

  final String label;
  final String value;
  final bool isHighlightedValue;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: 14.w400.copyWith(color: colorScheme.onSurfaceVariant),
            ),
          ),
          16.horizSpacing,
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: 14.w500.copyWith(
                color: isHighlightedValue
                    ? colorScheme.primary
                    : colorScheme.onSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
