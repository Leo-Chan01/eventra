import 'package:eventra/core/utils/global_snackbar.dart';
import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/home/presentation/widgets/profile_bullet_row.dart';
import 'package:eventra/features/home/presentation/widgets/profile_detail_header_card.dart';
import 'package:eventra/features/home/presentation/widgets/profile_surface_card.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/resources/resources.dart';
import 'package:eventra/shared/widgets/eventra_buttons/eventra_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePrivacyPolicyPage extends StatelessWidget {
  const ProfilePrivacyPolicyPage({super.key});

  static const String path = '/profile-privacy-policy';
  static const String name = 'profile-privacy-policy';

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
            EventraVectors.angleLeft,
            width: 18,
            height: 18,
            colorFilter: ColorFilter.mode(
              colorScheme.onSurface,
              BlendMode.srcIn,
            ),
          ),
        ),
        title: Text(
          l10n.privacyPolicyLink,
          style: 18.w600.copyWith(color: colorScheme.onSurface),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 28),
        child: Column(
          children: [
            ProfileDetailHeaderCard(
              iconPath: EventraVectors.yourPrivacyMattersIconProfileSettings,
              title: l10n.profilePrivacyPolicyHeaderTitle,
              subtitle: l10n.profilePrivacyPolicyLastUpdated,
            ),
            16.vertSpacing,
            ProfileSurfaceCard(
              backgroundColor: colorScheme.primaryContainer.withValues(
                alpha: 0.35,
              ),
              child: Text(
                l10n.profilePrivacyPolicyIntro,
                style: 15.w500.copyWith(
                  color: colorScheme.primary,
                  height: 1.55,
                ),
              ),
            ),
            16.vertSpacing,
            ProfileSurfaceCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.profilePrivacyPolicyInformationCollected,
                    style: 16.w700.copyWith(color: colorScheme.onSurface),
                  ),
                  12.vertSpacing,
                  ProfileBulletRow(
                    text: l10n.profilePrivacyPolicyCollectedItem1,
                    leading: Text(
                      '•',
                      style: 16.w700.copyWith(color: colorScheme.onSurface),
                    ),
                  ),
                  10.vertSpacing,
                  ProfileBulletRow(
                    text: l10n.profilePrivacyPolicyCollectedItem2,
                    leading: Text(
                      '•',
                      style: 16.w700.copyWith(color: colorScheme.onSurface),
                    ),
                  ),
                  10.vertSpacing,
                  ProfileBulletRow(
                    text: l10n.profilePrivacyPolicyCollectedItem3,
                    leading: Text(
                      '•',
                      style: 16.w700.copyWith(color: colorScheme.onSurface),
                    ),
                  ),
                  10.vertSpacing,
                  ProfileBulletRow(
                    text: l10n.profilePrivacyPolicyCollectedItem4,
                    leading: Text(
                      '•',
                      style: 16.w700.copyWith(color: colorScheme.onSurface),
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
                    l10n.profilePrivacyPolicyUsageTitle,
                    style: 16.w700.copyWith(color: colorScheme.onSurface),
                  ),
                  12.vertSpacing,
                  ProfileBulletRow(
                    text: l10n.profilePrivacyPolicyUsageItem1,
                    leading: Text(
                      '•',
                      style: 16.w700.copyWith(color: colorScheme.onSurface),
                    ),
                  ),
                  10.vertSpacing,
                  ProfileBulletRow(
                    text: l10n.profilePrivacyPolicyUsageItem2,
                    leading: Text(
                      '•',
                      style: 16.w700.copyWith(color: colorScheme.onSurface),
                    ),
                  ),
                  10.vertSpacing,
                  ProfileBulletRow(
                    text: l10n.profilePrivacyPolicyUsageItem3,
                    leading: Text(
                      '•',
                      style: 16.w700.copyWith(color: colorScheme.onSurface),
                    ),
                  ),
                  10.vertSpacing,
                  ProfileBulletRow(
                    text: l10n.profilePrivacyPolicyUsageItem4,
                    leading: Text(
                      '•',
                      style: 16.w700.copyWith(color: colorScheme.onSurface),
                    ),
                  ),
                  10.vertSpacing,
                  ProfileBulletRow(
                    text: l10n.profilePrivacyPolicyUsageItem5,
                    leading: Text(
                      '•',
                      style: 16.w700.copyWith(color: colorScheme.onSurface),
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
                    l10n.profilePrivacyPolicyProtectionTitle,
                    style: 16.w700.copyWith(color: colorScheme.onSurface),
                  ),
                  12.vertSpacing,
                  ProfileBulletRow(
                    text: l10n.profilePrivacyPolicyProtectionItem1,
                    leading: Text(
                      '•',
                      style: 16.w700.copyWith(color: colorScheme.onSurface),
                    ),
                  ),
                  10.vertSpacing,
                  ProfileBulletRow(
                    text: l10n.profilePrivacyPolicyProtectionItem2,
                    leading: Text(
                      '•',
                      style: 16.w700.copyWith(color: colorScheme.onSurface),
                    ),
                  ),
                  10.vertSpacing,
                  ProfileBulletRow(
                    text: l10n.profilePrivacyPolicyProtectionItem3,
                    leading: Text(
                      '•',
                      style: 16.w700.copyWith(color: colorScheme.onSurface),
                    ),
                  ),
                  10.vertSpacing,
                  ProfileBulletRow(
                    text: l10n.profilePrivacyPolicyProtectionItem4,
                    leading: Text(
                      '•',
                      style: 16.w700.copyWith(color: colorScheme.onSurface),
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
                    l10n.profilePrivacyPolicySharingTitle,
                    style: 16.w700.copyWith(color: colorScheme.onSurface),
                  ),
                  12.vertSpacing,
                  ProfileBulletRow(
                    text: l10n.profilePrivacyPolicySharingItem1,
                    leading: Text(
                      '•',
                      style: 16.w700.copyWith(color: colorScheme.onSurface),
                    ),
                  ),
                  10.vertSpacing,
                  ProfileBulletRow(
                    text: l10n.profilePrivacyPolicySharingItem2,
                    leading: Text(
                      '•',
                      style: 16.w700.copyWith(color: colorScheme.onSurface),
                    ),
                  ),
                  10.vertSpacing,
                  ProfileBulletRow(
                    text: l10n.profilePrivacyPolicySharingItem3,
                    leading: Text(
                      '•',
                      style: 16.w700.copyWith(color: colorScheme.onSurface),
                    ),
                  ),
                  10.vertSpacing,
                  ProfileBulletRow(
                    text: l10n.profilePrivacyPolicySharingItem4,
                    leading: Text(
                      '•',
                      style: 16.w700.copyWith(color: colorScheme.onSurface),
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
                    l10n.profilePrivacyPolicyRightsTitle,
                    style: 16.w700.copyWith(color: colorScheme.onSurface),
                  ),
                  14.vertSpacing,
                  ProfileBulletRow(
                    text: l10n.profilePrivacyPolicyRightsItem1,
                    leading: Icon(
                      Icons.check_circle_rounded,
                      size: 18,
                      color: colorScheme.tertiary,
                    ),
                  ),
                  10.vertSpacing,
                  ProfileBulletRow(
                    text: l10n.profilePrivacyPolicyRightsItem2,
                    leading: Icon(
                      Icons.check_circle_rounded,
                      size: 18,
                      color: colorScheme.tertiary,
                    ),
                  ),
                  10.vertSpacing,
                  ProfileBulletRow(
                    text: l10n.profilePrivacyPolicyRightsItem3,
                    leading: Icon(
                      Icons.check_circle_rounded,
                      size: 18,
                      color: colorScheme.tertiary,
                    ),
                  ),
                  10.vertSpacing,
                  ProfileBulletRow(
                    text: l10n.profilePrivacyPolicyRightsItem4,
                    leading: Icon(
                      Icons.check_circle_rounded,
                      size: 18,
                      color: colorScheme.tertiary,
                    ),
                  ),
                ],
              ),
            ),
            16.vertSpacing,
            ProfileSurfaceCard(
              backgroundColor: colorScheme.tertiaryContainer.withValues(
                alpha: 0.45,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.profilePrivacyPolicyQuestionsTitle,
                    style: 18.w700.copyWith(color: colorScheme.onSurface),
                  ),
                  10.vertSpacing,
                  Text(
                    l10n.profilePrivacyPolicyQuestionsSubtitle,
                    style: 14.w400.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      height: 1.45,
                    ),
                  ),
                  14.vertSpacing,
                  Text(
                    l10n.profilePrivacyPolicyEmail,
                    style: 14.w700.copyWith(color: colorScheme.onSurface),
                  ),
                  8.vertSpacing,
                  Text(
                    l10n.profilePrivacyPolicyPhone,
                    style: 14.w700.copyWith(color: colorScheme.onSurface),
                  ),
                ],
              ),
            ),
            22.vertSpacing,
            EventraButton.smallBorder(
              buttonText: l10n.profilePrivacyPolicyButton,
              onPressed: () {
                Navigator.of(context).pop();
                GlobalSnackBar.showInfo(l10n.profilePrivacyPolicyAcknowledged);
              },
            ),
          ],
        ),
      ),
    );
  }
}
