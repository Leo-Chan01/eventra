import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/client_notification/presentation/widgets/transaction_amount_text.dart';
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
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: colorScheme.surfaceContainerHighest),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: 11.w500.copyWith(color: colorScheme.onSurfaceVariant),
            ),
            8.vertSpacing,
            TransactionAmountText(
              amountLabel: amount,
              style: 18.w900.copyWith(color: colorScheme.onSurface),
              nairaSize: 14,
            ),
          ],
        ),
      ),
    );
  }
}
