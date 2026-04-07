import 'package:eventra/core/utils/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeBottomNavItem extends StatelessWidget {
  const HomeBottomNavItem({
    required this.label,
    required this.isActive,
    required this.onTap,
    super.key,
    this.iconPath,
    this.pathIsImage = false,
    this.iconData,
  }) : assert(
         iconPath != null || iconData != null,
         'Either iconPath or iconData must be provided.',
       );

  final String? iconPath;
  final IconData? iconData;
  final String label;
  final bool isActive;
  final bool pathIsImage;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final iconColor = isActive
        ? colorScheme.primary
        : colorScheme.onSurfaceVariant;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (iconPath != null)
            pathIsImage
                ? Image.asset(
                    iconPath!,
                    width: 22,
                    height: 22,
                    color: iconColor,
                  )
                : SvgPicture.asset(
                    iconPath!,
                    width: 22,
                    height: 22,
                    colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
                  )
          else
            Icon(iconData, color: iconColor, size: 22),
          4.vertSpacing,
          Text(
            label,
            style: 10.w600.copyWith(color: iconColor),
          ),
        ],
      ),
    );
  }
}
