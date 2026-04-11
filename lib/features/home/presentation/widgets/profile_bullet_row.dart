import 'package:eventra/core/utils/num_extensions.dart';
import 'package:flutter/material.dart';

class ProfileBulletRow extends StatelessWidget {
  const ProfileBulletRow({
    required this.text,
    required this.leading,
    this.color,
    this.fontSize = 14,
    super.key,
  });

  final String text;
  final Widget leading;
  final Color? color;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 2),
          child: leading,
        ),
        10.horizSpacing,
        Expanded(
          child: Text(
            text,
            style: fontSize.w400.copyWith(
              color: color ?? colorScheme.onSurfaceVariant,
              height: 1.45,
            ),
          ),
        ),
      ],
    );
  }
}
