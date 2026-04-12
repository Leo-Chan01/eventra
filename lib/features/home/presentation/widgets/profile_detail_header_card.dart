import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/home/presentation/widgets/profile_surface_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileDetailHeaderCard extends StatelessWidget {
  const ProfileDetailHeaderCard({
    required this.iconPath,
    required this.title,
    required this.subtitle,
    this.footerText,
    this.footerIconPath,
    this.backgroundColor,
    this.isImage = false,
    super.key,
  });

  final String iconPath;
  final String title;
  final String subtitle;
  final String? footerText;
  final String? footerIconPath;
  final Color? backgroundColor;
  final bool isImage;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ProfileSurfaceCard(
      backgroundColor: backgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: BorderRadius.circular(28),
            ),
            child: Center(
              child: isImage
                  ? Image.asset(
                      iconPath,
                      width: 50,
                      height: 50,
                    )
                  : SvgPicture.asset(
                      iconPath,
                      width: 28,
                      height: 28,
                      colorFilter: ColorFilter.mode(
                        colorScheme.onSurface,
                        BlendMode.srcIn,
                      ),
                    ),
            ),
          ),
          14.horizSpacing,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: 16.w700.copyWith(color: colorScheme.onSurface),
                ),
                4.vertSpacing,
                Text(
                  subtitle,
                  style: 14.w400.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    height: 1.3,
                  ),
                ),
                if (footerText != null) ...[
                  10.vertSpacing,
                  Row(
                    children: [
                      if (footerIconPath != null) ...[
                        SvgPicture.asset(
                          footerIconPath!,
                          width: 16,
                          height: 16,
                        ),
                        8.horizSpacing,
                      ],
                      Expanded(
                        child: Text(
                          footerText!,
                          style: 13.w500.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
