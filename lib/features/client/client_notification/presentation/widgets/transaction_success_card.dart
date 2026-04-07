import 'package:eventra/core/utils/num_extensions.dart';
import 'package:flutter/material.dart';

class TransactionSuccessCard extends StatelessWidget {
  const TransactionSuccessCard({
    required this.title,
    required this.message,
    required this.amount,
    required this.dateLabel,
    super.key,
  });

  final String title;
  final String message;
  final String amount;
  final String dateLabel;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.18),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        children: [
          Icon(
            Icons.check_circle_rounded,
            color: colorScheme.primary,
            size: 28,
          ),
          8.vertSpacing,
          Text(
            title,
            style: 16.w700.copyWith(color: colorScheme.primary),
          ),
          6.vertSpacing,
          Text(
            message,
            textAlign: TextAlign.center,
            style: 11.w400.copyWith(color: colorScheme.onSurfaceVariant),
          ),
          12.vertSpacing,
          Text(
            amount,
            style: 28.w700.copyWith(color: colorScheme.onSurface),
          ),
          6.vertSpacing,
          Text(
            dateLabel,
            style: 10.w500.copyWith(color: colorScheme.onSurfaceVariant),
          ),
        ],
      ),
    );
  }
}
