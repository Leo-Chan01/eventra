import 'package:eventra/core/utils/num_extensions.dart';
import 'package:flutter/material.dart';

class TransactionSummaryCard extends StatelessWidget {
  const TransactionSummaryCard({
    required this.label,
    required this.amount,
    super.key,
  });

  final String label;
  final String amount;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.22),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: 11.w500.copyWith(color: colorScheme.onSurfaceVariant),
            ),
            const SizedBox(height: 8),
            Text(
              amount,
              style: 20.w700.copyWith(color: colorScheme.onSurface),
            ),
          ],
        ),
      ),
    );
  }
}
