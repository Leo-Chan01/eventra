import 'package:eventra/core/utils/num_extensions.dart';
import 'package:flutter/material.dart';

class TicketSuccessDetailRow extends StatelessWidget {
  const TicketSuccessDetailRow({
    required this.label,
    required this.value,
    this.valueColor,
    this.valueStyle,
    super.key,
  });

  final String label;
  final String value;
  final Color? valueColor;
  final TextStyle? valueStyle;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: 16.w400.copyWith(color: colorScheme.onSurfaceVariant),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            value,
            style:
                valueStyle?.copyWith(
                  color: valueColor ?? colorScheme.onSurface,
                ) ??
                16.w500.copyWith(color: valueColor ?? colorScheme.onSurface),
          ),
        ],
      ),
    );
  }
}
