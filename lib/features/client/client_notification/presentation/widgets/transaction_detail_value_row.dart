import 'package:eventra/core/utils/num_extensions.dart';
import 'package:flutter/material.dart';

class TransactionDetailValueRow extends StatelessWidget {
  const TransactionDetailValueRow({
    required this.label,
    required this.value,
    super.key,
    this.valueColor,
    this.isEmphasized = false,
    this.isVertical = false,
    this.isBothEmphashized = false,
  });

  final String label;
  final String value;
  final Color? valueColor;
  final bool isEmphasized;
  final bool isVertical;
  final bool isBothEmphashized;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    if (isVertical) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: (isBothEmphashized ? 12.w800 : 12.w500).copyWith(
              color: isBothEmphashized
                  ? colorScheme.onSurface
                  : colorScheme.onSurfaceVariant,
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

    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: (isBothEmphashized ? 12.w800 : 12.w500).copyWith(
              color: isBothEmphashized
                  ? colorScheme.onSurface
                  : colorScheme.onSurfaceVariant,
            ),
          ),
        ),
        Text(
          value,
          style:
              (isBothEmphashized ? 14.w800 : (isEmphasized ? 14.w700 : 12.w600))
                  .copyWith(
                    color: valueColor ?? colorScheme.onSurface,
                  ),
        ),
      ],
    );
  }
}
