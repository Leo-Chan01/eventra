import 'package:eventra/core/utils/boxshadow_util.dart';
import 'package:eventra/core/utils/global_snackbar.dart';
import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/home/domain/models/home_app_toggle_type.dart';
import 'package:eventra/features/home/presentation/bloc/home_bloc.dart';
import 'package:eventra/features/home/presentation/pages/profile_app_reset_page.dart';
import 'package:eventra/features/home/presentation/pages/profile_privacy_policy_page.dart';
import 'package:eventra/features/home/presentation/pages/profile_rate_us_page.dart';
import 'package:eventra/features/home/presentation/pages/profile_terms_and_conditions_page.dart';
import 'package:eventra/features/home/presentation/widgets/home_notification_preference_tile.dart';
import 'package:eventra/features/home/presentation/widgets/home_profile_section_title.dart';
import 'package:eventra/features/home/presentation/widgets/profile_detail_header_card.dart';
import 'package:eventra/features/home/presentation/widgets/profile_settings_action_tile.dart';
import 'package:eventra/features/home/presentation/widgets/profile_surface_card.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class ProfileAppSettingsPage extends StatelessWidget {
  const ProfileAppSettingsPage({super.key});

  static const String path = '/profile-app-settings';
  static const String name = 'profile-app-settings';

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
              l10n.homeProfileAppSettings,
              style: 18.w600.copyWith(color: colorScheme.onSurface),
            ),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileDetailHeaderCard.withRows(
                  isImage: true,
                  iconPath: EventraImages.nigeriaFlagInCircle,
                  title: l10n.profileAppSettingsAppName,
                  subtitle: l10n.profileAppSettingsVersionValue,
                  footerText: l10n.profileAppSettingsMadeInNigeria,
                ),
                28.vertSpacing,
                HomeProfileSectionTitle(
                  title: l10n.profileAppSettingsAppearance,
                ),
                12.vertSpacing,
                ProfileSurfaceCard(
                  padding: EdgeInsets.zero,
                  child: Column(
                    children: [
                      HomeNotificationPreferenceTile(
                        title: l10n.profileAppSettingsDarkModeTitle,
                        subtitle: l10n.profileAppSettingsDarkModeSubtitle,
                        value: state.darkModeEnabled,
                        onChanged: (value) {
                          context.read<HomeBloc>().add(
                            HomeAppToggleChanged(
                              type: HomeAppToggleType.darkMode,
                              isEnabled: value,
                            ),
                          );
                        },
                      ),
                      standardDividerUtil(context),
                      ProfileSettingsActionTile(
                        title: l10n.profileAppSettingsLanguageTitle,
                        subtitle: state.selectedLanguage,
                        showChevron: true,
                        onTap: () {
                          GlobalSnackBar.showInfo(
                            l10n.profileAppSettingsLanguageFeedback,
                          );
                        },
                      ),
                    ],
                  ),
                ),
                24.vertSpacing,
                HomeProfileSectionTitle(
                  title: l10n.profileAppSettingsDataStorage,
                ),
                12.vertSpacing,
                ProfileSurfaceCard(
                  padding: EdgeInsets.zero,
                  child: Column(
                    children: [
                      HomeNotificationPreferenceTile(
                        title: l10n.profileAppSettingsAutoDownloadTitle,
                        subtitle: l10n.profileAppSettingsAutoDownloadSubtitle,
                        value: state.autoDownloadImagesEnabled,
                        onChanged: (value) {
                          context.read<HomeBloc>().add(
                            HomeAppToggleChanged(
                              type: HomeAppToggleType.autoDownloadImages,
                              isEnabled: value,
                            ),
                          );
                        },
                      ),
                      standardDividerUtil(context),
                      HomeNotificationPreferenceTile(
                        title: l10n.profileAppSettingsDataSaverTitle,
                        subtitle: l10n.profileAppSettingsDataSaverSubtitle,
                        value: state.dataSaverModeEnabled,
                        onChanged: (value) {
                          context.read<HomeBloc>().add(
                            HomeAppToggleChanged(
                              type: HomeAppToggleType.dataSaverMode,
                              isEnabled: value,
                            ),
                          );
                        },
                      ),
                      standardDividerUtil(context),
                      ProfileSettingsActionTile(
                        title: l10n.profileAppSettingsClearCacheTitle,
                        subtitle: l10n.profileAppSettingsClearCacheSubtitle,
                        trailingText: l10n.profileAppSettingsCacheSize,
                        onTap: () {
                          GlobalSnackBar.showInfo(
                            l10n.profileAppSettingsClearCacheFeedback,
                          );
                        },
                      ),
                    ],
                  ),
                ),
                24.vertSpacing,
                HomeProfileSectionTitle(title: l10n.profileAppSettingsAdvanced),
                12.vertSpacing,
                ProfileSurfaceCard(
                  padding: EdgeInsets.zero,
                  child: Column(
                    children: [
                      HomeNotificationPreferenceTile(
                        title: l10n.profileAppSettingsOfflineModeTitle,
                        subtitle: l10n.profileAppSettingsOfflineModeSubtitle,
                        value: state.offlineModeEnabled,
                        onChanged: (value) {
                          context.read<HomeBloc>().add(
                            HomeAppToggleChanged(
                              type: HomeAppToggleType.offlineMode,
                              isEnabled: value,
                            ),
                          );
                        },
                      ),
                      standardDividerUtil(context),
                      ProfileSettingsActionTile(
                        title: l10n.profileAppSettingsResetAppTitle,
                        subtitle: l10n.profileAppSettingsResetAppSubtitle,
                        showChevron: true,
                        onTap: () async {
                          await context.pushNamed(ProfileAppResetPage.name);
                        },
                      ),
                    ],
                  ),
                ),
                24.vertSpacing,
                HomeProfileSectionTitle(title: l10n.profileAppSettingsAbout),
                12.vertSpacing,
                ProfileSurfaceCard(
                  padding: EdgeInsets.zero,
                  child: Column(
                    children: [
                      ProfileSettingsActionTile(
                        title: l10n.profileAppSettingsTermsOfService,
                        showChevron: true,
                        onTap: () async {
                          await context.pushNamed(
                            ProfileTermsAndConditionsPage.name,
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
                      standardDividerUtil(context),
                      ProfileSettingsActionTile(
                        title: l10n.profileAppSettingsRateEventra,
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: List.generate(
                            5,
                            (_) => Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 1,
                              ),
                              child: SvgPicture.asset(
                                EventraVectors.starVector,
                                width: 16,
                                height: 16,
                              ),
                            ),
                          ),
                        ),
                        onTap: () async {
                          await context.pushNamed(ProfileRateUsPage.name);
                        },
                      ),
                    ],
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
