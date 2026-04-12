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
    this.isWithRows = false,
    this.isImage = false,
    super.key,
  });

  const ProfileDetailHeaderCard.withRows({
    required this.iconPath,
    required this.title,
    required this.subtitle,
    this.footerText,
    this.footerIconPath,
    this.backgroundColor,
    this.isImage = false,
    this.isWithRows = true,
    super.key,
  });

  final String iconPath;
  final String title;
  final String subtitle;
  final String? footerText;
  final String? footerIconPath;
  final Color? backgroundColor;
  final bool isImage;
  final bool isWithRows;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    if (isWithRows) {
      return ProfileSurfaceCard(
        backgroundColor: backgroundColor,
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (isImage)
                    Image.asset(
                      iconPath,
                      width: 50,
                      height: 50,
                    )
                  else
                    SvgPicture.asset(
                      iconPath,
                      height: 50,
                      width: 50,
                      colorFilter: ColorFilter.mode(
                        colorScheme.onSurface,
                        BlendMode.srcIn,
                      ),
                    ),
                  12.horizSpacing,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
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
                    ],
                  ),
                ],
              ),
              if (footerText != null) ...[
                10.vertSpacing,
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (footerIconPath != null) ...[
                      SvgPicture.asset(
                        footerIconPath!,
                        width: 16,
                        height: 16,
                      ),
                      8.horizSpacing,
                    ],
                    Text(
                      footerText!,
                      style: 13.w500.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      );
    }

    return ProfileSurfaceCard(
      backgroundColor: backgroundColor,
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isImage)
              Image.asset(
                iconPath,
                width: 50,
                height: 50,
              )
            else
              SvgPicture.asset(
                iconPath,
                height: 50,
                width: 50,
                colorFilter: ColorFilter.mode(
                  colorScheme.onSurface,
                  BlendMode.srcIn,
                ),
              ),
            12.horizSpacing,
            Column(
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
          ],
        ),
      ),
    );
  }
}
