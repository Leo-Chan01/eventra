import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/client_notification/domain/models/transaction_record.dart';
import 'package:eventra/features/client/client_notification/presentation/widgets/transaction_amount_text.dart';
import 'package:eventra/features/client/client_notification/presentation/widgets/transaction_status_badge.dart';
import 'package:eventra/resources/resources.dart';
import 'package:eventra/shared/theme/color_schemes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        ? AppColorSchemes.successDark
        : colorScheme.onSurface;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        padding: const EdgeInsets.fromLTRB(18, 16, 18, 14),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(18),
        ),
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
                        style: 15.w700.copyWith(color: colorScheme.onSurface),
                      ),
                      4.vertSpacing,
                      Text(
                        transaction.category,
                        style: 12.w400.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                12.horizSpacing,
                TransactionAmountText(
                  amountLabel: transaction.amountLabel,
                  style: 15.w700.copyWith(color: amountColor),
                  nairaSize: 10,
                ),
              ],
            ),
            10.vertSpacing,
            Row(
              children: [
                TransactionStatusBadge(
                  status: transaction.status,
                  label: statusLabel,
                ),
                const Spacer(),
                SvgPicture.asset(
                  EventraVectors.calendarIcon,
                  width: 12,
                  height: 12,
                ),
                4.horizSpacing,
                Text(
                  transaction.dateLabel,
                  style: 11.w500.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
            12.vertSpacing,
            Divider(
              height: 1,
              color: colorScheme.outlineVariant.withValues(alpha: 0.2),
            ),
            12.vertSpacing,
            Row(
              children: [
                Expanded(
                  child: Text(
                    transaction.paymentSource,
                    style: 11.w500.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                12.horizSpacing,
                Expanded(
                  child: Text(
                    transaction.reference,
                    textAlign: TextAlign.end,
                    style: 11.w500.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
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
