import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TicketCounterButton extends StatelessWidget {
  const TicketCounterButton({
    required this.icon,
    required this.onTap,
    super.key,
  });

  final String icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Material(
      color: colorScheme.surface,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: SizedBox(
          width: 28,
          height: 28,
          child: SvgPicture.asset(
            icon,
            width: 28,
            height: 28,
            colorFilter: ColorFilter.mode(
              colorScheme.onSurface,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
