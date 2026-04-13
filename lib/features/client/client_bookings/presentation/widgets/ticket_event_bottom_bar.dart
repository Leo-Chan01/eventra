import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/shared/widgets/eventra_buttons/eventra_button.dart';
import 'package:flutter/material.dart';

class TicketEventBottomBar extends StatelessWidget {
  const TicketEventBottomBar({
    required this.onBuyTicket,
    required this.buyTicketLabel,
    required this.totalPriceLabel,
    super.key,
  });

  final VoidCallback onBuyTicket;
  final String buyTicketLabel;
  final String totalPriceLabel;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      color: colorScheme.surface,
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: EventraButton(
              buttonText: buyTicketLabel,
              onPressed: onBuyTicket,
            ),
          ),
          16.horizSpacing,
          Expanded(
            child: Text(
              totalPriceLabel,
              style: 20.w700.copyWith(color: colorScheme.onSurface),
            ),
          ),
        ],
      ),
    );
  }
}
