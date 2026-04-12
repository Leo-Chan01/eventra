import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/home/domain/models/home_enquiry_status.dart';
import 'package:eventra/features/home/presentation/bloc/home_bloc.dart';
import 'package:eventra/features/home/presentation/widgets/home_enquiry_banner.dart';
import 'package:eventra/features/home/presentation/widgets/home_enquiry_status_tabs.dart';
import 'package:eventra/features/home/presentation/widgets/home_enquiry_vendor_card.dart';
import 'package:eventra/features/home/presentation/widgets/home_search_bar.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart' as intl;

class HomeEnquiriesTab extends StatelessWidget {
  const HomeEnquiriesTab({
    required this.state,
    required this.onOpenFilter,
    required this.onOpenLocationLookup,
    super.key,
  });

  final HomeState state;
  final VoidCallback onOpenFilter;
  final VoidCallback onOpenLocationLookup;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;
    final localeTag = Localizations.localeOf(context).toLanguageTag();
    final formattedDate = intl.DateFormat.yMMMMd(
      localeTag,
    ).format(DateTime(2026, 3, 15));

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(0, 16, 0, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  l10n.navEnquiries,
                  style: 24.w700.copyWith(color: colorScheme.onSurface),
                ),
                SvgPicture.asset(EventraVectors.supportIconEnquiries),
              ],
            ),
          ),
          18.vertSpacing,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: HomeSearchBar(
              onTapFilter: onOpenFilter,
              onTapSearch: onOpenLocationLookup,
            ),
          ),
          16.vertSpacing,
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: HomeEnquiryStatusTabs(
                selectedStatus: state.selectedEnquiryStatus,
                onStatusSelected: (status) {
                  context.read<HomeBloc>().add(
                    HomeEnquiryStatusChanged(status),
                  );
                },
                pendingLabel: l10n.notificationsFilterPending,
                awaitingPaymentLabel: l10n.homeEnquiryStatusAwaitingPayment,
                activeLabel: l10n.homeEnquiryStatusActive,
                completedLabel: l10n.notificationsFilterCompleted,
              ),
            ),
          ),
          18.vertSpacing,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: HomeEnquiryBanner(
              message: _statusMessage(l10n, state.selectedEnquiryStatus),
            ),
          ),
          18.vertSpacing,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: state.allVendors
                  .map(
                    (vendor) => Padding(
                      padding: const EdgeInsets.only(bottom: 14),
                      child: HomeEnquiryVendorCard(
                        vendor: vendor,
                        dateLabel: formattedDate,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  String _statusMessage(
    AppLocalizations l10n,
    HomeEnquiryStatus status,
  ) {
    return switch (status) {
      HomeEnquiryStatus.pending => l10n.homeEnquiryBannerPending,
      HomeEnquiryStatus.awaitingPayment =>
        l10n.homeEnquiryBannerAwaitingPayment,
      HomeEnquiryStatus.active => l10n.homeEnquiryBannerActive,
      HomeEnquiryStatus.completed => l10n.homeEnquiryBannerCompleted,
    };
  }
}
