import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/client_bookings/presentation/models/enquiry_flow_details_args.dart';
import 'package:eventra/features/client/client_bookings/presentation/pages/active_enquiry_detail_page.dart';
import 'package:eventra/features/client/client_bookings/presentation/pages/completed_enquiry_detail_page.dart';
import 'package:eventra/features/client/client_bookings/presentation/pages/pending_enquiry_detail_page.dart';
import 'package:eventra/features/home/domain/models/home_enquiry_status.dart';
import 'package:eventra/features/home/presentation/bloc/home_bloc.dart';
import 'package:eventra/features/home/presentation/models/vendor_booking_filter_type.dart';
import 'package:eventra/features/home/presentation/widgets/home_enquiry_banner.dart';
import 'package:eventra/features/home/presentation/widgets/home_search_bar.dart';
import 'package:eventra/features/home/presentation/widgets/vendor_booking_status_tabs.dart';
import 'package:eventra/features/home/presentation/widgets/vendor_booking_vendor_card.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart' as intl;

class VendorBookingsTab extends StatefulWidget {
  const VendorBookingsTab({
    required this.state,
    required this.onOpenFilter,
    required this.onOpenSearch,
    super.key,
  });

  final HomeState state;
  final VoidCallback onOpenFilter;
  final VoidCallback onOpenSearch;

  @override
  State<VendorBookingsTab> createState() => VendorBookingsTabState();
}

class VendorBookingsTabState extends State<VendorBookingsTab> {
  VendorBookingFilterType selectedFilter = VendorBookingFilterType.all;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;
    final localeTag = Localizations.localeOf(context).toLanguageTag();
    final formattedDate = intl.DateFormat.yMMMMd(
      localeTag,
    ).format(DateTime(2026, 3, 15));

    final vendorsWithStatus = widget.state.allVendors.asMap().entries.map((
      entry,
    ) {
      final index = entry.key;
      final vendor = entry.value;
      final status = index % 3 == 0
          ? HomeEnquiryStatus.pending
          : index % 3 == 1
          ? HomeEnquiryStatus.active
          : HomeEnquiryStatus.completed;
      return (vendor: vendor, status: status);
    }).toList();

    final filtered = selectedFilter == VendorBookingFilterType.all
        ? vendorsWithStatus
        : vendorsWithStatus.where((item) {
            if (selectedFilter == VendorBookingFilterType.pending) {
              return item.status == HomeEnquiryStatus.pending;
            }
            if (selectedFilter == VendorBookingFilterType.active) {
              return item.status == HomeEnquiryStatus.active;
            }
            return item.status == HomeEnquiryStatus.completed;
          }).toList();

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
              onTapFilter: widget.onOpenFilter,
              onTapSearch: widget.onOpenSearch,
            ),
          ),
          16.vertSpacing,
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: VendorBookingStatusTabs(
                selectedFilter: selectedFilter,
                onFilterSelected: (filter) {
                  setState(() {
                    selectedFilter = filter;
                  });
                },
                l10n: l10n,
              ),
            ),
          ),
          if (selectedFilter == VendorBookingFilterType.pending) ...[
            18.vertSpacing,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: HomeEnquiryBanner(
                message: l10n.vendorBookingsPendingBanner,
                isDottedBorder: true,
              ),
            ),
          ],
          18.vertSpacing,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: filtered.map((item) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 14),
                  child: VendorBookingVendorCard(
                    vendor: item.vendor,
                    status: item.status,
                    dateLabel: formattedDate,
                    l10n: l10n,
                    onTap: () async {
                      final flowArgs = EnquiryFlowDetailsArgs(
                        vendor: item.vendor,
                        invoiceId: '6354728',
                        bookingReferenceId: '737367483929210',
                        amount: 10500000,
                        dateIssued: DateTime(2025, 4, 24),
                        eventDate: DateTime(2025, 7, 6),
                        eventType: l10n.enquiryFlowSampleEventType,
                        location: l10n.enquiryFlowSampleLocation,
                        eventTime: l10n.enquiryFlowSampleTime,
                        inspirationImages: const [
                          EventraImages.weddingImage,
                          EventraImages.womanWithweddinggown,
                          EventraImages.decoratorPerson,
                        ],
                        deliverables: l10n.enquiryFlowSampleDeliverables,
                        termsAndConditions: l10n.enquiryFlowSampleTerms,
                      );

                      if (item.status == HomeEnquiryStatus.completed) {
                        await context.pushNamed(
                          CompletedEnquiryDetailPage.name,
                          extra: CompletedEnquiryDetailPageArgs(
                            vendor: item.vendor,
                            invoiceId: '6354728',
                            bookingReferenceId: '737367483929210',
                            amountPaid: 10500000,
                            dateIssued: DateTime(2025, 4, 24),
                            eventDate: DateTime(2025, 7, 6),
                          ),
                        );
                        return;
                      }

                      if (item.status == HomeEnquiryStatus.active) {
                        await context.pushNamed(
                          ActiveEnquiryDetailPage.name,
                          extra: flowArgs,
                        );
                        return;
                      }

                      await context.pushNamed(
                        PendingEnquiryDetailPage.name,
                        extra: flowArgs,
                      );
                    },
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
