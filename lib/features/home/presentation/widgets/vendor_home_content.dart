import 'package:eventra/core/utils/boxshadow_util.dart';
import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/client_inbox/presentation/pages/client_inbox_page.dart';
import 'package:eventra/features/client/client_notification/presentation/pages/client_notifications_page.dart';
import 'package:eventra/features/home/presentation/bloc/home_bloc.dart';
import 'package:eventra/features/home/presentation/pages/profile_app_settings_page.dart';
import 'package:eventra/features/home/presentation/widgets/location_selection_widget.dart';
import 'package:eventra/features/home/presentation/widgets/vendor_bookings_overview_card.dart';
import 'package:eventra/features/home/presentation/widgets/vendor_home_promo_banner.dart';
import 'package:eventra/features/home/presentation/widgets/vendor_quick_stats_card.dart';
import 'package:eventra/features/home/presentation/widgets/vendor_wallet_summary_card.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class VendorHomeContent extends StatelessWidget {
  const VendorHomeContent({
    required this.state,
    super.key,
  });

  final HomeState state;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;
    final fullName = state.profile.fullName.trim();
    final userName = fullName.isEmpty
        ? l10n.vendorHomeDefaultUserName
        : fullName;

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${l10n.homeHello} $userName',
                      style: 20.w500.copyWith(color: colorScheme.onSurface),
                    ),
                    6.vertSpacing,
                    LocationSelectionWidget(
                      colorScheme: colorScheme,
                      l10n: l10n,
                      locationLabel: state.selectedAddress,
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () => context.pushNamed(ClientInboxPage.name),
                icon: SvgPicture.asset(
                  EventraVectors.customerSupportIconGrey,
                  width: 26,
                  height: 26,
                  colorFilter: ColorFilter.mode(
                    colorScheme.onSurfaceVariant,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              Stack(
                children: [
                  IconButton(
                    onPressed: () =>
                        context.pushNamed(ClientNotificationsPage.name),
                    icon: SvgPicture.asset(
                      EventraVectors.notificationBellIcon,
                      width: 26,
                      height: 26,
                      colorFilter: ColorFilter.mode(
                        colorScheme.onSurfaceVariant,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: Container(
                      width: 14,
                      height: 14,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: colorScheme.error,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '10',
                        style: 8.w600.copyWith(color: colorScheme.onError),
                      ),
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () => context.pushNamed(ProfileAppSettingsPage.name),
                icon: SvgPicture.asset(
                  EventraVectors.settingsCogIconGrey,
                  width: 26,
                  height: 26,
                  colorFilter: ColorFilter.mode(
                    colorScheme.onSurfaceVariant,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ],
          ),
          16.vertSpacing,
          const VendorWalletSummaryCard(),
          22.vertSpacing,
          Text(
            l10n.vendorHomeBookings,
            style: 14.w500.copyWith(
              color: colorScheme.onSurface,
            ),
          ),
          12.vertSpacing,
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: BorderRadius.circular(24),
              boxShadow: boxShadowLight,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: VendorBookingsOverviewCard(
                        count: '20',
                        title: l10n.vendorHomeTodaysEnquiries,
                      ),
                    ),
                    12.horizSpacing,
                    Expanded(
                      child: VendorBookingsOverviewCard(
                        count: '20',
                        title: l10n.vendorHomeUpcomingEvents,
                      ),
                    ),
                  ],
                ),
                12.vertSpacing,
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: colorScheme.surface,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                      color: colorScheme.outline.withValues(alpha: 0.08),
                      width: 1.5,
                    ),
                    // boxShadow: boxShadowLight,
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: colorScheme.error,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          '4',
                          style: 14.w500.copyWith(color: colorScheme.onError),
                        ),
                      ),
                      12.horizSpacing,
                      Expanded(
                        child: Text(
                          l10n.vendorHomeNewMessages,
                          style: 14.w500.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => context.read<HomeBloc>().add(
                          const HomeTabChanged(1),
                        ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            color: colorScheme.surfaceContainerLow,
                            borderRadius: BorderRadius.circular(999),
                            border: Border.all(
                              color: colorScheme.outline.withValues(alpha: 0.1),
                              width: 1.5,
                            ),
                          ),
                          child: Text(
                            l10n.vendorHomeViewMessages,
                            style: 12.w500.copyWith(color: colorScheme.primary),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          20.vertSpacing,
          const VendorHomePromoBanner(),
          24.vertSpacing,
          Text(
            l10n.vendorHomeQuickStats,
            style: 14.w500.copyWith(
              color: colorScheme.onSurface,
            ),
          ),
          12.vertSpacing,
          VendorQuickStatsCard(
            earnings: 'N500K',
            reviewsCount: '50',
            listingsCount: '9',
            earningsLabel: l10n.vendorHomeThisMonthEarnings,
            reviewsLabel: l10n.vendorHomeReviews,
            listingsLabel: l10n.vendorHomeMenuListings,
          ),
        ],
      ),
    );
  }
}
