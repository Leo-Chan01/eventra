import 'package:eventra/core/utils/num_extensions.dart';
import 'package:flutter/material.dart';

class HomeNotificationNoteCard extends StatelessWidget {
  const HomeNotificationNoteCard({
    required this.message,
    super.key,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colorScheme.primary.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: colorScheme.primary,
        ),
      ),
      child: RichText(
        text: TextSpan(
          text: 'Note: ',
          style: 15.w600.copyWith(
            color: colorScheme.primary,
            height: 1.45,
          ),
          children: [
            TextSpan(
              text: message,
              style: 15.w400.copyWith(
                color: colorScheme.primary,
                height: 1.45,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
