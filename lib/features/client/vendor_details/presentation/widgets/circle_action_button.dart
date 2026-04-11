import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CircleActionButton extends StatelessWidget {
  const CircleActionButton({
    required this.icon,
    required this.onPressed,
    super.key,
  });

  final String icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    // final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        width: 36,
        height: 36,
        child: SvgPicture.asset(
          icon,
          width: 18,
          height: 18,
        ),
      ),
    );
  }
}
