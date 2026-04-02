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
            shape: BoxShape.circle,
            border: Border.all(
              color: colorScheme.outline.withValues(alpha: 0.1),
            ),
          ),
          child: IconButton(
            onPressed: onPressed,
            icon: icon,
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
