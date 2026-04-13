import 'package:eventra/core/utils/num_extensions.dart';
import 'package:flutter/material.dart';

class TicketTagPill extends StatelessWidget {
  const TicketTagPill({required this.label, super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: colorScheme.surface.withValues(alpha: 0.45),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        label,
        style: 13.w500.copyWith(color: colorScheme.onPrimary),
      ),
    );
  }
}
