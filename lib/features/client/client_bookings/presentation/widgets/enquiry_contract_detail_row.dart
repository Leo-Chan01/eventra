import 'package:eventra/core/utils/num_extensions.dart';
import 'package:flutter/material.dart';

class EnquiryContractDetailRow extends StatelessWidget {
  const EnquiryContractDetailRow({
    required this.label,
    required this.value,
    this.emphasized = false,
    super.key,
  });

  final String label;
  final String value;
  final bool emphasized;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              label,
              style: 14.w500.copyWith(color: colorScheme.onSurfaceVariant),
            ),
          ),
          8.horizSpacing,
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: 14.w500.copyWith(
                fontWeight: emphasized ? FontWeight.w700 : FontWeight.w500,
                color: emphasized ? colorScheme.primary : colorScheme.onSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
