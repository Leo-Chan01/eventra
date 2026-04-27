import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TicketCounterButton extends StatelessWidget {
  const TicketCounterButton({
    required this.icon,
    required this.onTap,
    this.size = 28,
    super.key,
  });

  final String icon;
  final VoidCallback onTap;
  final double size;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: size,
        height: size,
        child: SvgPicture.asset(
          icon,
          width: size,
          height: size,
          colorFilter: ColorFilter.mode(
            colorScheme.onSurface,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
