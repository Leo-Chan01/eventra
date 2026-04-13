import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/client_bookings/presentation/models/ticket_checkout_args.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class TicketCheckoutEventSummary extends StatelessWidget {
  const TicketCheckoutEventSummary({
    required this.args,
    super.key,
  });

  final TicketCheckoutArgs args;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;
    final localeTag = Localizations.localeOf(context).toLanguageTag();
    final dateLabel = intl.DateFormat(
      'EEEE, MMM d, y',
      localeTag,
    ).format(args.eventDate);
    final timeLabel = intl.DateFormat(
      'h:mma',
      localeTag,
    ).format(args.eventDate);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            args.eventImage,
            width: double.infinity,
            height: 160,
            fit: BoxFit.cover,
          ),
        ),
        16.vertSpacing,
        Text(
          args.eventTitle,
          style: 20.w600.copyWith(color: colorScheme.onSurface),
        ),
        10.vertSpacing,
        Text(
          args.location,
          style: 15.w400.copyWith(color: colorScheme.onSurfaceVariant),
        ),
        10.vertSpacing,
        Text(
          l10n.ticketCheckoutDateTime(dateLabel, timeLabel),
          style: 15.w400.copyWith(color: colorScheme.onSurfaceVariant),
        ),
      ],
    );
  }
}
