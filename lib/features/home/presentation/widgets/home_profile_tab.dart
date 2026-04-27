import 'package:eventra/core/utils/boxshadow_util.dart';
import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/account_type_tracker/presentation/bloc/account_type_tracker_bloc.dart';
import 'package:eventra/features/auth/login/presentation/pages/login_page.dart';
import 'package:eventra/features/auth/signup/presentation/pages/vendor_kyc_page.dart';
import 'package:eventra/features/client/vendor_details/presentation/models/vendor_detail_page_args.dart';
import 'package:eventra/features/client/vendor_details/presentation/pages/vendor_detail_page.dart';
import 'package:eventra/features/home/domain/models/home_profile.dart';
import 'package:eventra/features/home/presentation/pages/profile_app_settings_page.dart';
import 'package:eventra/features/home/presentation/pages/profile_help_support_page.dart';
import 'package:eventra/features/home/presentation/pages/profile_notification_settings_page.dart';
import 'package:eventra/features/home/presentation/pages/profile_personal_information_page.dart';
import 'package:eventra/features/home/presentation/pages/profile_privacy_security_page.dart';
import 'package:eventra/features/home/presentation/pages/profile_saved_vendors_page.dart';
import 'package:eventra/features/home/presentation/pages/profile_vendor_contract_page.dart';
import 'package:eventra/features/home/presentation/widgets/home_profile_header_card.dart';
import 'package:eventra/features/home/presentation/widgets/home_profile_kyc_banner.dart';
import 'package:eventra/features/home/presentation/widgets/home_profile_logout_tile.dart';
import 'package:eventra/features/home/presentation/widgets/home_profile_menu_tile.dart';
import 'package:eventra/features/home/presentation/widgets/home_profile_section_title.dart';
import 'package:eventra/features/home/presentation/widgets/home_profile_stat_card.dart';
import 'package:eventra/features/onboarding/onboarding_loading/presentation/pages/onboarding_loading_page.dart';
import 'package:eventra/features/onboarding/onboarding_slides/domain/models/account_type.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/resources/resources.dart';
import 'package:eventra/shared/widgets/eventra_dialogs/account_type_switch_confirmation_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class HomeProfileTab extends StatelessWidget {
  const HomeProfileTab({
    required this.profile,
    required this.onBack,
    this.isVendorMode = false,
    super.key,
  });

  final HomeProfile profile;
  final VoidCallback onBack;
  final bool isVendorMode;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;

    return SingleChildScrollView(
      key: const Key('home_profile_tab'),
      padding: const EdgeInsets.fromLTRB(24, 12, 24, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              InkWell(
                onTap: onBack,
                borderRadius: BorderRadius.circular(999),
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: SvgPicture.asset(
                    EventraVectors.angleRight,
                    width: 18,
                    height: 18,
                    colorFilter: ColorFilter.mode(
                      colorScheme.onSurface,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  l10n.homeProfileSettingsTitle,
                  textAlign: TextAlign.center,
                  style: 20.w700.copyWith(color: colorScheme.onSurface),
                ),
              ),
              // const SizedBox(width: 26),
              if (isVendorMode)
                InkWell(
                  onTap: () async {
                    await context.pushNamed(
                      VendorDetailPage.name,
                      extra: const VendorDetailPageArgs(
                        vendorId: 'vendor-001',
                        isVendorMode: true,
                        initialTabIndex: 1,
                      ),
                    );
                  },
                  child: SvgPicture.asset(EventraVectors.catalogIconProfile),
                ),
            ],
          ),
          20.vertSpacing,
          HomeProfileHeaderCard(profile: profile),
          18.vertSpacing,
          Row(
            children: [
              Expanded(
                child: HomeProfileStatCard(
                  value: '${profile.bookingsCount}',
                  label: l10n.homeProfileBookings,
                ),
              ),
              12.horizSpacing,
              Expanded(
                child: HomeProfileStatCard(
                  value: '${profile.reviewsCount}',
                  label: l10n.homeProfileReviews,
                ),
              ),
              12.horizSpacing,
              Expanded(
                child: HomeProfileStatCard(
                  value: '${profile.favoritesCount}',
                  label: l10n.homeProfileFavorites,
                ),
              ),
            ],
          ),
          28.vertSpacing,
          if (isVendorMode) ...[
            HomeProfileKycBanner(
              onTap: () async {
                await context.pushNamed(VendorKycPage.name);
              },
            ),
            28.vertSpacing,
          ],
          HomeProfileSectionTitle(title: l10n.homeProfileAccount),
          12.vertSpacing,
          Container(
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: BorderRadius.circular(24),
              boxShadow: boxShadowLight,
            ),
            child: Column(
              children: [
                HomeProfileMenuTile(
                  iconPath:
                      EventraVectors.personalInformationIconProfileSettings,
                  label: l10n.homeProfilePersonalInformation,
                  onTap: () async {
                    await context.pushNamed(
                      ProfilePersonalInformationPage.name,
                    );
                  },
                ),
                standardDividerUtil(context),
                HomeProfileMenuTile(
                  iconPath: EventraVectors.notificaionBellIconProfileSettings,
                  label: l10n.homeProfileNotifications,
                  onTap: () async {
                    await context.pushNamed(
                      ProfileNotificationSettingsPage.name,
                    );
                  },
                ),
                standardDividerUtil(context),
                if (isVendorMode) ...[
                  HomeProfileMenuTile(
                    iconPath: EventraVectors.viewVendorsContract,
                    label: l10n.homeProfileViewVendorContract,
                    onTap: () async {
                      await context.pushNamed(ProfileVendorContractPage.name);
                    },
                  ),
                  standardDividerUtil(context),
                ],
                HomeProfileMenuTile(
                  iconPath: EventraVectors.privacySecurityIconProfileSettings,
                  label: l10n.homeProfilePrivacySecurity,
                  onTap: () async {
                    await context.pushNamed(ProfilePrivacySecurityPage.name);
                  },
                ),
              ],
            ),
          ),
          24.vertSpacing,
          HomeProfileSectionTitle(title: l10n.homeProfilePreferences),
          12.vertSpacing,
          Container(
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerLowest,
              borderRadius: BorderRadius.circular(24),
              boxShadow: boxShadowLight,
            ),
            child: Column(
              children: [
                HomeProfileMenuTile(
                  iconPath: EventraVectors.savedVendorsIconProfileSettings,
                  label: l10n.homeProfileSavedVendors,
                  onTap: () async {
                    await context.pushNamed(ProfileSavedVendorsPage.name);
                  },
                ),
                standardDividerUtil(context),
                HomeProfileMenuTile(
                  iconPath: EventraVectors.switchToVendorIconProfileSettings,
                  label: isVendorMode
                      ? l10n.homeProfileSwitchToClient
                      : l10n.homeProfileSwitchToVendor,
                  onTap: () async {
                    final targetAccountType = isVendorMode
                        ? AccountType.client
                        : AccountType.vendor;
                    final shouldSwitch =
                        await AccountTypeSwitchConfirmationDialog.show(
                          context,
                          targetAccountType: targetAccountType,
                        ) ??
                        false;

                    if (!context.mounted || !shouldSwitch) {
                      return;
                    }

                    context.read<AccountTypeTrackerBloc>().add(
                      AccountTypeSelected(targetAccountType),
                    );
                    context.goNamed(OnboardingLoadingPage.name);
                  },
                ),
              ],
            ),
          ),
          24.vertSpacing,
          HomeProfileSectionTitle(title: l10n.homeProfileSupport),
          12.vertSpacing,
          Container(
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerLowest,
              borderRadius: BorderRadius.circular(24),
              boxShadow: boxShadowLight,
            ),
            child: Column(
              children: [
                HomeProfileMenuTile(
                  iconPath: EventraVectors.helpSupportIconProfileSettings,
                  label: l10n.homeProfileHelpSupport,
                  onTap: () async {
                    await context.pushNamed(ProfileHelpSupportPage.name);
                  },
                ),
                standardDividerUtil(context),
                HomeProfileMenuTile(
                  iconPath: EventraVectors.appSettingsIconProfileSettings,
                  label: l10n.homeProfileAppSettings,
                  onTap: () async {
                    await context.pushNamed(ProfileAppSettingsPage.name);
                  },
                ),
              ],
            ),
          ),
          24.vertSpacing,
          HomeProfileLogoutTile(
            label: l10n.homeProfileLogout,
            onTap: () {
              context.goNamed(LoginPage.name);
            },
          ),
        ],
      ),
    );
  }
}
