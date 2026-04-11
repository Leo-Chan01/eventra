import 'package:eventra/core/utils/num_extensions.dart';
import 'package:flutter/material.dart';

class HomeNotificationPreferenceTile extends StatelessWidget {
  const HomeNotificationPreferenceTile({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
    super.key,
  });

  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: 16.w600.copyWith(color: colorScheme.onSurface),
                ),
                6.vertSpacing,
                Text(
                  subtitle,
                  style: 14.w400.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    height: 1.25,
                  ),
                ),
              ],
            ),
          ),
          12.horizSpacing,
          Transform.scale(
            scale: 0.88,
            child: Switch.adaptive(
              value: value,
              onChanged: onChanged,
              activeColor: colorScheme.onPrimary,
              activeTrackColor: colorScheme.primary,
              inactiveThumbColor: colorScheme.surface,
              inactiveTrackColor: colorScheme.surfaceContainerHighest,
            ),
          ),
        ],
      ),
    );
  }
}
