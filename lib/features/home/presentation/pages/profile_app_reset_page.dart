import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/home/presentation/widgets/profile_bullet_row.dart';
import 'package:eventra/features/home/presentation/widgets/profile_detail_header_card.dart';
import 'package:eventra/features/home/presentation/widgets/profile_surface_card.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileAppResetPage extends StatelessWidget {
  const ProfileAppResetPage({super.key});

  static const String path = '/profile-app-reset';
  static const String name = 'profile-app-reset';

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.of(context).maybePop(),
          icon: SvgPicture.asset(
            EventraVectors.angleRight,
            width: 18,
            height: 18,
            colorFilter: ColorFilter.mode(
              colorScheme.onSurface,
              BlendMode.srcIn,
            ),
          ),
        ),
        title: Text(
          l10n.profileAppResetPageTitle,
          style: 18.w600.copyWith(color: colorScheme.onSurface),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 28),
        child: Column(
          children: [
            ProfileDetailHeaderCard(
              iconPath: EventraVectors.cautionRedExclamationIconProfileSettings,
              title: l10n.profileAppResetCautionTitle,
              subtitle: l10n.profileAppResetCautionSubtitle,
            ),
            16.vertSpacing,
            ProfileSurfaceCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.profileAppResetBeforeResetTitle,
                    style: 16.w700.copyWith(color: colorScheme.onSurface),
                  ),
                  10.vertSpacing,
                  Text(
                    l10n.profileAppResetBeforeResetBody,
                    style: 14.w400.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            16.vertSpacing,
            ProfileSurfaceCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.profileAppResetSettingsOnlyTitle,
                    style: 16.w700.copyWith(color: colorScheme.onSurface),
                  ),
                  10.vertSpacing,
                  Text(
                    l10n.profileAppResetSettingsOnlyBody,
                    style: 14.w400.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      height: 1.5,
                    ),
                  ),
                  14.vertSpacing,
                  ProfileBulletRow(
                    text: l10n.profileAppResetKeepBookings,
                    leading: Icon(
                      Icons.check_rounded,
                      size: 16,
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  8.vertSpacing,
                  ProfileBulletRow(
                    text: l10n.profileAppResetKeepSavedVendors,
                    leading: Icon(
                      Icons.check_rounded,
                      size: 16,
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  8.vertSpacing,
                  ProfileBulletRow(
                    text: l10n.profileAppResetKeepProfileData,
                    leading: Icon(
                      Icons.check_rounded,
                      size: 16,
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  8.vertSpacing,
                  ProfileBulletRow(
                    text: l10n.profileAppResetPreferencesOnly,
                    color: colorScheme.error,
                    leading: Icon(
                      Icons.close_rounded,
                      size: 16,
                      color: colorScheme.error,
                    ),
                  ),
                ],
              ),
            ),
            16.vertSpacing,
            ProfileSurfaceCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.profileAppResetEverythingTitle,
                    style: 16.w700.copyWith(color: colorScheme.onSurface),
                  ),
                  10.vertSpacing,
                  Text(
                    l10n.profileAppResetEverythingBody,
                    style: 14.w400.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      height: 1.5,
                    ),
                  ),
                  14.vertSpacing,
                  ProfileBulletRow(
                    text: l10n.profileAppResetDeleteBookings,
                    color: colorScheme.error,
                    leading: Icon(
                      Icons.close_rounded,
                      size: 16,
                      color: colorScheme.error,
                    ),
                  ),
                  8.vertSpacing,
                  ProfileBulletRow(
                    text: l10n.profileAppResetDeleteSavedVendors,
                    color: colorScheme.error,
                    leading: Icon(
                      Icons.close_rounded,
                      size: 16,
                      color: colorScheme.error,
                    ),
                  ),
                  8.vertSpacing,
                  ProfileBulletRow(
                    text: l10n.profileAppResetDeleteProfileData,
                    color: colorScheme.error,
                    leading: Icon(
                      Icons.close_rounded,
                      size: 16,
                      color: colorScheme.error,
                    ),
                  ),
                  8.vertSpacing,
                  ProfileBulletRow(
                    text: l10n.profileAppResetDeleteAccount,
                    color: colorScheme.error,
                    leading: Icon(
                      Icons.close_rounded,
                      size: 16,
                      color: colorScheme.error,
                    ),
                  ),
                ],
              ),
            ),
            16.vertSpacing,
            ProfileSurfaceCard(
              backgroundColor: colorScheme.primaryContainer.withValues(
                alpha: 0.4,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.profileAppResetNeedHelpTitle,
                    style: 16.w700.copyWith(color: colorScheme.primary),
                  ),
                  10.vertSpacing,
                  Text(
                    l10n.profileAppResetNeedHelpSubtitle,
                    style: 14.w500.copyWith(color: colorScheme.primary),
                  ),
                  12.vertSpacing,
                  ProfileBulletRow(
                    text: l10n.profileAppResetNeedHelpStep1,
                    color: colorScheme.primary,
                    leading: Text(
                      '•',
                      style: 16.w700.copyWith(color: colorScheme.primary),
                    ),
                  ),
                  8.vertSpacing,
                  ProfileBulletRow(
                    text: l10n.profileAppResetNeedHelpStep2,
                    color: colorScheme.primary,
                    leading: Text(
                      '•',
                      style: 16.w700.copyWith(color: colorScheme.primary),
                    ),
                  ),
                  8.vertSpacing,
                  ProfileBulletRow(
                    text: l10n.profileAppResetNeedHelpStep3,
                    color: colorScheme.primary,
                    leading: Text(
                      '•',
                      style: 16.w700.copyWith(color: colorScheme.primary),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
