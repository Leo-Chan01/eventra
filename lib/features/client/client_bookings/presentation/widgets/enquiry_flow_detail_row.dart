import 'package:eventra/core/utils/num_extensions.dart';
import 'package:flutter/material.dart';

class EnquiryFlowDetailRow extends StatelessWidget {
  const EnquiryFlowDetailRow({
    required this.label,
    required this.value,
    this.valueColor,
    this.valueWeight,
    super.key,
  });

  final String label;
  final String value;
  final Color? valueColor;
  final FontWeight? valueWeight;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
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
              style: 14.w400.copyWith(
                fontWeight: valueWeight ?? FontWeight.w500,
                color: valueColor ?? colorScheme.onSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
