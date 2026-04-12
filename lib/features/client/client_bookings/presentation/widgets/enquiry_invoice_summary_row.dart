import 'package:eventra/core/utils/num_extensions.dart';
import 'package:flutter/material.dart';

class EnquiryInvoiceSummaryRow extends StatelessWidget {
  const EnquiryInvoiceSummaryRow({
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

    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: 16.w500.copyWith(
              fontWeight: emphasized ? FontWeight.w700 : FontWeight.w500,
              color: emphasized
                  ? colorScheme.onSurface
                  : colorScheme.onSurfaceVariant,
            ),
          ),
        ),
        Text(
          value,
          style: 16.w700.copyWith(color: colorScheme.onSurface),
        ),
      ],
    );
  }
}
