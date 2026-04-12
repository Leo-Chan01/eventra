import 'package:eventra/core/utils/num_extensions.dart';
import 'package:flutter/material.dart';

class CompletedEnquiryDetailRow extends StatelessWidget {
  const CompletedEnquiryDetailRow({
    required this.label,
    required this.value,
    this.valueColor,
    this.isEmphasizedValue = false,
    super.key,
  });

  final String label;
  final String value;
  final Color? valueColor;
  final bool isEmphasizedValue;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              label,
              style: 14.w400.copyWith(color: colorScheme.onSurfaceVariant),
            ),
          ),
          12.horizSpacing,
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: isEmphasizedValue
                  ? 14.bold.copyWith(color: valueColor ?? colorScheme.onSurface)
                  : 14.w500.copyWith(
                      color: valueColor ?? colorScheme.onSurface,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
