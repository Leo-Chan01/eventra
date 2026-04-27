import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/client_bookings/presentation/widgets/ticket_counter_button.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';

class AddItemQuantityField extends StatelessWidget {
  const AddItemQuantityField({
    required this.label,
    required this.value,
    required this.onDecrease,
    required this.onIncrease,
    super.key,
  });

  final String label;
  final int value;
  final VoidCallback onDecrease;
  final VoidCallback onIncrease;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: 14.w400,
        ),
        8.vertSpacing,
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: colorScheme.outline),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TicketCounterButton(
                  icon: EventraVectors.minusItemIcon,
                  onTap: onDecrease,
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      '$value',
                      style: 16.w500.copyWith(color: colorScheme.onSurface),
                    ),
                  ),
                ),
                TicketCounterButton(
                  icon: EventraVectors.addItemIcon,
                  onTap: onIncrease,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
