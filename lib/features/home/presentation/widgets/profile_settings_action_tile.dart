import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileSettingsActionTile extends StatelessWidget {
  const ProfileSettingsActionTile({
    required this.title,
    this.subtitle,
    this.trailingText,
    this.trailing,
    this.showChevron = false,
    this.chevronVariant = false,
    this.onTap,
    super.key,
  });

  final String title;
  final String? subtitle;
  final String? trailingText;
  final Widget? trailing;
  final bool showChevron;
  final VoidCallback? onTap;
  final bool chevronVariant;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: 16.w600.copyWith(color: colorScheme.onSurface),
                  ),
                  if (subtitle != null) ...[
                    6.vertSpacing,
                    Text(
                      subtitle!,
                      style: 14.w400.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        height: 1.25,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            12.horizSpacing,
            if (trailingText != null)
              Text(
                trailingText!,
                style: 14.w500.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            if (trailingText != null && (trailing != null || showChevron))
              8.horizSpacing,
            if (trailing != null)
              trailing!
            else if (showChevron)
              SvgPicture.asset(
                chevronVariant
                    ? EventraVectors.nextPageArrowIcon
                    : EventraVectors.angleLeft,
                width: 18,
                height: 18,
                colorFilter: ColorFilter.mode(
                  colorScheme.onSurfaceVariant,
                  BlendMode.srcIn,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
