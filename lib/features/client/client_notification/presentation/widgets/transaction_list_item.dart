import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/client_notification/domain/models/transaction_record.dart';
import 'package:eventra/features/client/client_notification/presentation/widgets/transaction_status_badge.dart';
import 'package:flutter/material.dart';

class TransactionListItem extends StatelessWidget {
  const TransactionListItem({
    required this.transaction,
    required this.statusLabel,
    required this.onTap,
    super.key,
  });

  final TransactionRecord transaction;
  final String statusLabel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final amountColor = transaction.isCredit
        ? colorScheme.primary
        : colorScheme.onSurface;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transaction.vendorName,
                        style: 13.w700.copyWith(color: colorScheme.onSurface),
                      ),
                      2.vertSpacing,
                      Text(
                        transaction.category,
                        style: 11.w400.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  transaction.amountLabel,
                  style: 13.w700.copyWith(color: amountColor),
                ),
              ],
            ),
            8.vertSpacing,
            Row(
              children: [
                TransactionStatusBadge(
                  status: transaction.status,
                  label: statusLabel,
                ),
                const Spacer(),
                Icon(
                  Icons.calendar_today_outlined,
                  size: 12,
                  color: colorScheme.onSurfaceVariant,
                ),
                4.horizSpacing,
                Text(
                  transaction.dateLabel,
                  style: 10.w500.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
            6.vertSpacing,
            Row(
              children: [
                Text(
                  transaction.paymentSource,
                  style: 10.w500.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                const Spacer(),
                Text(
                  transaction.reference,
                  style: 10.w500.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
