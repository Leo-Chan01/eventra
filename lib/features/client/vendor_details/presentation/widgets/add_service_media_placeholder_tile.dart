import 'package:eventra/core/utils/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class AddServiceMediaPlaceholderTile extends StatelessWidget {
  const AddServiceMediaPlaceholderTile({
    required this.icon,
    this.height,
    this.iconSize = 36,
    this.title,
    this.subtitle,
    super.key,
  });

  final List<List<dynamic>> icon;
  final double? height;
  final double iconSize;
  final String? title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      height: height,
      decoration: BoxDecoration(
        color: colorScheme.onSurface.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            HugeIcon(
              icon: icon,
              size: iconSize,
              color: colorScheme.onSurfaceVariant,
            ),
            if (title != null) ...[
              16.vertSpacing,
              Text(
                title!,
                style: 18.w600.copyWith(color: colorScheme.onSurface),
                textAlign: TextAlign.center,
              ),
            ],
            if (subtitle != null) ...[
              10.vertSpacing,
              Text(
                subtitle!,
                style: 14.w400.copyWith(color: colorScheme.onSurfaceVariant),
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
