import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/client_bookings/presentation/widgets/ticket_counter_button.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TicketEventTicketOptionRow extends StatelessWidget {
  const TicketEventTicketOptionRow({
    required this.ticketName,
    required this.priceLabel,
    required this.quantity,
    required this.soldOutLabel,
    required this.isSoldOut,
    required this.onDecrease,
    required this.onIncrease,
    super.key,
  });

  final String ticketName;
  final String priceLabel;
  final int quantity;
  final String soldOutLabel;
  final bool isSoldOut;
  final VoidCallback onDecrease;
  final VoidCallback onIncrease;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          SvgPicture.asset(
            EventraVectors.ticketIconEvents,
            height: 28,
            width: 28,
            colorFilter: ColorFilter.mode(
              colorScheme.onSurfaceVariant,
              BlendMode.srcIn,
            ),
          ),
          10.horizSpacing,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ticketName,
                  style: 12.w500.copyWith(color: colorScheme.onSurfaceVariant),
                ),
                6.vertSpacing,
                Text(
                  priceLabel,
                  style: 14.w700.copyWith(color: colorScheme.primary),
                ),
              ],
            ),
          ),
          if (isSoldOut)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: colorScheme.onSurface.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(28),
              ),
              child: Text(
                soldOutLabel,
                style: 14.w500.copyWith(color: colorScheme.onSurfaceVariant),
              ),
            )
          else
            Row(
              children: [
                TicketCounterButton(
                  icon: EventraVectors.minusButtonTicket,
                  onTap: onDecrease,
                ),
                14.horizSpacing,
                Text(
                  '$quantity',
                  style: 18.w500.copyWith(color: colorScheme.onSurface),
                ),
                14.horizSpacing,
                TicketCounterButton(
                  icon: EventraVectors.addButtonTicket,
                  onTap: onIncrease,
                ),
              ],
            ),
        ],
      ),
    );
  }
}
