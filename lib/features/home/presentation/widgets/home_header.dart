import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    required this.userName,
    super.key,
  });

  final String userName;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  l10n.homeHello,
                  style: 20.regular.copyWith(
                    color: colorScheme.onSurface,
                  ),
                ),
                4.horizSpacing,
                Text(
                  userName,
                  style: 20.bold.copyWith(
                    color: colorScheme.onSurface,
                  ),
                ),
              ],
            ),
            Text(
              l10n.homeExplore,
              style: 14.regular.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
        Row(
          children: [
            _HeaderIcon(
              icon: Icons.chat_bubble_outline_rounded,
              onPressed: () {},
            ),
            12.horizSpacing,
            _HeaderIcon(
              icon: Icons.notifications_none_rounded,
              hasNotification: true,
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}

class _HeaderIcon extends StatelessWidget {
  const _HeaderIcon({
    required this.icon,
    required this.onPressed,
    this.hasNotification = false,
  });

  final IconData icon;
  final VoidCallback onPressed;
  final bool hasNotification;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: colorScheme.outline.withValues(alpha: 0.1),
            ),
          ),
          child: IconButton(
            onPressed: onPressed,
            icon: Icon(
              icon,
              color: colorScheme.onSurface,
              size: 24,
            ),
          ),
        ),
        if (hasNotification)
          Positioned(
            right: 8,
            top: 8,
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
