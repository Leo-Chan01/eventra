import 'package:eventra/core/utils/boxshadow_util.dart';
import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/client_bookings/presentation/models/ticket_checkout_args.dart';
import 'package:eventra/features/client/client_bookings/presentation/widgets/ticket_success_detail_row.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class TicketPaymentSuccessDetailCard extends StatelessWidget {
  const TicketPaymentSuccessDetailCard({
    required this.args,
    super.key,
  });

  final TicketCheckoutArgs args;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;
    final localeTag = Localizations.localeOf(context).toLanguageTag();
    final amountLabel = intl.NumberFormat.currency(
      locale: localeTag,
      symbol: '₦',
      decimalDigits: 2,
    ).format(args.totalAmount);
    final dateLabel = intl.DateFormat(
      'EEE, MMM d, y',
      localeTag,
    ).format(args.eventDate);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(18),
        boxShadow: boxShadowLight,
      ),
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 12),
      child: Column(
        children: [
          TicketSuccessDetailRow(
            label: l10n.ticketPaymentEventName,
            value: args.eventTitle,
          ),
          Divider(color: colorScheme.outline.withValues(alpha: 0.28)),
          TicketSuccessDetailRow(
            label: l10n.ticketPaymentTicketType,
            value: args.ticketType,
          ),
          Divider(color: colorScheme.outline.withValues(alpha: 0.28)),
          TicketSuccessDetailRow(
            label: l10n.ticketPaymentDate,
            value: dateLabel,
          ),
          Divider(color: colorScheme.outline.withValues(alpha: 0.28)),
          TicketSuccessDetailRow(
            label: l10n.ticketPaymentAmountPaid,
            value: amountLabel,
            valueColor: colorScheme.primary,
            valueStyle: 18.w700,
          ),
          Divider(color: colorScheme.outline.withValues(alpha: 0.28)),
          TicketSuccessDetailRow(
            label: l10n.ticketPaymentBookingReference,
            value: args.bookingReferenceId,
          ),
        ],
      ),
    );
  }
}
