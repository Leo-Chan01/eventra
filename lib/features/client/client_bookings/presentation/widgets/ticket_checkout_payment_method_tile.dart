import 'package:eventra/core/utils/num_extensions.dart';
import 'package:flutter/material.dart';

class TicketCheckoutPaymentMethodTile extends StatelessWidget {
  const TicketCheckoutPaymentMethodTile({
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
    super.key,
  });

  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: colorScheme.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                icon,
                color: colorScheme.onPrimary,
                size: 24,
              ),
            ),
            14.horizSpacing,
            Expanded(
              child: Text(
                label,
                style: 20.w500.copyWith(color: colorScheme.onSurface),
              ),
            ),
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: isSelected
                  ? colorScheme.primary
                  : colorScheme.onSurfaceVariant,
              size: 34,
            ),
          ],
        ),
      ),
    );
  }
}
