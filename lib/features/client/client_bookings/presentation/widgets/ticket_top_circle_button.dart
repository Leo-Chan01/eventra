import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TicketTopCircleButton extends StatelessWidget {
  const TicketTopCircleButton({
    required this.icon,
    required this.onTap,
    required this.iconColor,
    super.key,
  });

  final String icon;
  final VoidCallback onTap;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.surface,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: SizedBox(
          width: 44,
          height: 44,
          child: Center(
            child: SvgPicture.asset(
              icon,
              width: 20,
              height: 20,
              colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
            ),
          ),
        ),
      ),
    );
  }
}
