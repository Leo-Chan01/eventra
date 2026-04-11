import 'package:eventra/core/utils/boxshadow_util.dart';
import 'package:eventra/core/utils/global_snackbar.dart';
import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/home/domain/models/home_app_toggle_type.dart';
import 'package:eventra/features/home/presentation/bloc/home_bloc.dart';
import 'package:eventra/features/home/presentation/pages/profile_privacy_policy_page.dart';
import 'package:eventra/features/home/presentation/widgets/home_notification_preference_tile.dart';
import 'package:eventra/features/home/presentation/widgets/home_profile_section_title.dart';
import 'package:eventra/features/home/presentation/widgets/profile_detail_header_card.dart';
import 'package:eventra/features/home/presentation/widgets/profile_password_field.dart';
import 'package:eventra/features/home/presentation/widgets/profile_settings_action_tile.dart';
import 'package:eventra/features/home/presentation/widgets/profile_surface_card.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/resources/resources.dart';
import 'package:eventra/shared/widgets/eventra_buttons/eventra_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class ProfilePrivacySecurityPage extends StatelessWidget {
  const ProfilePrivacySecurityPage({super.key});

  static const String path = '/profile-privacy-security';
  static const String name = 'profile-privacy-security';

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
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
              l10n.homeProfilePrivacySecurity,
              style: 18.w600.copyWith(color: colorScheme.onSurface),
            ),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileDetailHeaderCard(
                  iconPath: EventraVectors.accountSecuredIconProfileSettings,
                  title: l10n.profilePrivacySecuritySecuredTitle,
                  subtitle: l10n.profilePrivacySecuritySecuredSubtitle,
                  footerText: l10n.profilePrivacySecuritySecuredFooter,
                  footerIconPath: EventraVectors
                      .transparentGreenCheckIconIconProfileSettings,
                ),
                24.vertSpacing,
                HomeProfileSectionTitle(
                  title: l10n.profilePrivacySecurityPasswordSection,
                ),
                12.vertSpacing,
                ProfileSurfaceCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProfilePasswordField(
                        label: l10n.profilePrivacySecurityCurrentPassword,
                        hintText:
                            l10n.profilePrivacySecurityCurrentPasswordHint,
                      ),
                      16.vertSpacing,
                      ProfilePasswordField(
                        label: l10n.profilePrivacySecurityNewPassword,
                        hintText: l10n.profilePrivacySecurityNewPasswordHint,
                      ),
                      16.vertSpacing,
                      ProfilePasswordField(
                        label: l10n.profilePrivacySecurityConfirmPassword,
                        hintText:
                            l10n.profilePrivacySecurityConfirmPasswordHint,
                      ),
                      20.vertSpacing,
                      EventraButton.smallBorder(
                        buttonText: l10n.profilePrivacySecurityUpdatePassword,
                        onPressed: () {
                          GlobalSnackBar.showInfo(
                            l10n.profilePrivacySecurityPasswordFeedback,
                          );
                        },
                      ),
                    ],
                  ),
                ),
                20.vertSpacing,
                HomeProfileSectionTitle(
                  title: l10n.profilePrivacySecurityOptionsSection,
                ),
                12.vertSpacing,
                ProfileSurfaceCard(
                  padding: EdgeInsets.zero,
                  child: Column(
                    children: [
                      HomeNotificationPreferenceTile(
                        title: l10n.profilePrivacySecurityTwoFactorTitle,
                        subtitle: l10n.profilePrivacySecurityTwoFactorSubtitle,
                        value: state.twoFactorAuthenticationEnabled,
                        onChanged: (value) {
                          context.read<HomeBloc>().add(
                            HomeAppToggleChanged(
                              type: HomeAppToggleType.twoFactorAuthentication,
                              isEnabled: value,
                            ),
                          );
                        },
                      ),
                      standardDividerUtil(context),
                      HomeNotificationPreferenceTile(
                        title: l10n.profilePrivacySecurityBiometricTitle,
                        subtitle: l10n.profilePrivacySecurityBiometricSubtitle,
                        value: state.biometricLoginEnabled,
                        onChanged: (value) {
                          context.read<HomeBloc>().add(
                            HomeAppToggleChanged(
                              type: HomeAppToggleType.biometricLogin,
                              isEnabled: value,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                20.vertSpacing,
                HomeProfileSectionTitle(
                  title: l10n.profilePrivacySecurityPrivacySection,
                ),
                12.vertSpacing,
                ProfileSurfaceCard(
                  padding: EdgeInsets.zero,
                  child: Column(
                    children: [
                      ProfileSettingsActionTile(
                        title: l10n.profilePrivacySecurityDownloadData,
                        trailingText: l10n.profilePrivacySecurityRequest,
                        onTap: () {
                          GlobalSnackBar.showInfo(
                            l10n.profilePrivacySecurityDownloadDataFeedback,
                          );
                        },
                      ),
                      standardDividerUtil(context),
                      ProfileSettingsActionTile(
                        title: l10n.privacyPolicyLink,
                        showChevron: true,
                        onTap: () async {
                          await context.pushNamed(
                            ProfilePrivacyPolicyPage.name,
                          );
                        },
                      ),
                    ],
                  ),
                ),
                20.vertSpacing,
                HomeProfileSectionTitle(
                  title: l10n.profilePrivacySecurityDangerZone,
                ),
                12.vertSpacing,
                ProfileSurfaceCard(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 18,
                  ),
                  child: InkWell(
                    onTap: () {
                      GlobalSnackBar.showInfo(
                        l10n.profilePrivacySecurityDeleteAccountFeedback,
                      );
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.delete_outline_rounded,
                          color: colorScheme.error,
                        ),
                        12.horizSpacing,
                        Text(
                          l10n.profilePrivacySecurityDeleteAccount,
                          style: 16.w600.copyWith(color: colorScheme.error),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
