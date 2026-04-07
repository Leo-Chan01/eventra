import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeaderIcon extends StatelessWidget {
  const HeaderIcon({
    required this.icon,
    required this.onPressed,
    super.key,
    this.hasNotification = false,
  });

  final SvgPicture icon;
  final VoidCallback onPressed;
  final bool hasNotification;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.28),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: onPressed,
            icon: icon,
          ),
        ),
        if (hasNotification)
          Positioned(
            right: 10,
            top: 10,
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: colorScheme.error,
                shape: BoxShape.circle,
              ),
            ),
          ),
      ],
    );
  }
}
