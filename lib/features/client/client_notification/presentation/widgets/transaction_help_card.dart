import 'package:eventra/core/utils/num_extensions.dart';
import 'package:flutter/material.dart';

class TransactionHelpCard extends StatelessWidget {
  const TransactionHelpCard({
    required this.title,
    required this.message,
    required this.actionLabel,
    required this.onTap,
    super.key,
  });

  final String title;
  final String message;
  final String actionLabel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: colorScheme.primary.withValues(alpha: 0.06),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.info_outline_rounded,
                  size: 16,
                  color: colorScheme.primary,
                ),
                8.horizSpacing,
                Text(
                  title,
                  style: 12.w700.copyWith(color: colorScheme.primary),
                ),
              ],
            ),
            8.vertSpacing,
            Text(
              message,
              style: 11.w400.copyWith(
                color: colorScheme.onSurfaceVariant,
                height: 1.35,
              ),
            ),
            8.vertSpacing,
            Text(
              actionLabel,
              style: 11.w700.copyWith(color: colorScheme.primary),
            ),
          ],
        ),
      ),
    );
  }
}
