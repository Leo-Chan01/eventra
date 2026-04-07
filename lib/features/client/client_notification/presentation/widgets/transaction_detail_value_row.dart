import 'package:eventra/core/utils/num_extensions.dart';
import 'package:flutter/material.dart';

class TransactionDetailValueRow extends StatelessWidget {
  const TransactionDetailValueRow({
    required this.label,
    required this.value,
    super.key,
    this.valueColor,
    this.isEmphasized = false,
  });

  final String label;
  final String value;
  final Color? valueColor;
  final bool isEmphasized;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: 12.w500.copyWith(color: colorScheme.onSurfaceVariant),
          ),
        ),
        Text(
          value,
          style: (isEmphasized ? 14.w700 : 12.w600).copyWith(
            color: valueColor ?? colorScheme.onSurface,
          ),
        ),
      ],
    );
  }
}
