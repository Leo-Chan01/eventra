import 'package:eventra/core/utils/boxshadow_util.dart';
import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/home/domain/models/home_profile.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/resources/resources.dart';
import 'package:eventra/shared/theme/color_schemes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeProfileHeaderCard extends StatelessWidget {
  const HomeProfileHeaderCard({
    required this.profile,
    super.key,
  });

  final HomeProfile profile;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color: colorScheme.outlineVariant.withValues(alpha: 0.08),
        ),
        boxShadow: boxShadowLight,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CircleAvatar(
                      radius: 42,
                      backgroundImage: AssetImage(profile.avatarPath),
                    ),
                    Positioned(
                      right: -18,
                      bottom: -18,
                      child: SvgPicture.asset(
                        EventraVectors.editPencilElevated,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      profile.fullName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: 22.w700.copyWith(color: colorScheme.onSurface),
                    ),
                    6.vertSpacing,
                    Text(
                      profile.email,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: 14.w400.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                    10.vertSpacing,
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: AppColorSchemes.successDark.withValues(
                          alpha: 0.16,
                        ),
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Text(
                        context.l10n.homeProfileMemberSince(
                          profile.memberSince,
                        ),
                        style: 12.w400.copyWith(
                          color: AppColorSchemes.successDark,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          16.vertSpacing,
          standardDividerUtil(context),
          16.vertSpacing,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 4,
                child: Row(
                  children: [
                    SvgPicture.asset(
                      EventraVectors.callIcon,
                      width: 18,
                      height: 18,
                      colorFilter: ColorFilter.mode(
                        colorScheme.onSurfaceVariant,
                        BlendMode.srcIn,
                      ),
                    ),
                    10.horizSpacing,
                    Expanded(
                      child: Text(
                        profile.phoneNumber,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: 13.w500.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Expanded(
                flex: 3,
                child: Row(
                  children: [
                    SvgPicture.asset(
                      EventraVectors.locationPinLineIcon,
                      width: 18,
                      height: 18,
                      colorFilter: ColorFilter.mode(
                        colorScheme.onSurfaceVariant,
                        BlendMode.srcIn,
                      ),
                    ),
                    8.horizSpacing,
                    Expanded(
                      child: Text(
                        profile.location,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: 13.w500.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
