import 'package:eventra/core/utils/num_extensions.dart';
import 'package:flutter/material.dart';

class EnquiryContractHighlightRow extends StatelessWidget {
  const EnquiryContractHighlightRow({
    required this.label,
    required this.value,
    required this.valueColor,
    required this.highlightColor,
    super.key,
  });

  final String label;
  final String value;
  final Color valueColor;
  final Color highlightColor;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 6),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: highlightColor.withValues(alpha: 0.07),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: 13.w400.copyWith(color: colorScheme.onSurface),
            ),
          ),
          Text(value, style: 14.w700.copyWith(color: valueColor)),
        ],
      ),
    );
  }
}
