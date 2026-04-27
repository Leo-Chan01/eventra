import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/client_bookings/presentation/pages/new_invoice_page.dart';
import 'package:eventra/features/client/client_bookings/presentation/widgets/ticket_counter_button.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    required this.item,
    required this.amountText,
    required this.lineSummaryText,
    required this.onDecrease,
    required this.onIncrease,
    super.key,
  });

  final InvoiceItem item;
  final String amountText;
  final String lineSummaryText;
  final VoidCallback onDecrease;
  final VoidCallback onIncrease;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.description,
                  style: 18.w500.copyWith(color: colorScheme.onSurface),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                30.vertSpacing,
                Text(
                  lineSummaryText,
                  style: 16.w400.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          12.horizSpacing,
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                amountText,
                style: 18.w500.copyWith(color: colorScheme.onSurface),
              ),
              24.vertSpacing,
              Container(
                height: 48,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    TicketCounterButton(
                      icon: EventraVectors.minusButtonTicket,
                      onTap: onDecrease,
                    ),
                    16.horizSpacing,
                    Text(
                      '${item.quantity}',
                      style: 18.w500.copyWith(color: colorScheme.onSurface),
                    ),
                    16.horizSpacing,
                    TicketCounterButton(
                      icon: EventraVectors.addButtonTicket,
                      onTap: onIncrease,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
