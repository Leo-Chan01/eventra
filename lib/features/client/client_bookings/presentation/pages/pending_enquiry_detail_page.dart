//
// ignore_for_file: lines_longer_than_80_chars

import 'package:eventra/core/utils/global_snackbar.dart';
import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/client_bookings/presentation/models/enquiry_flow_details_args.dart';
import 'package:eventra/features/client/client_bookings/presentation/widgets/enquiry_flow_detail_row.dart';
import 'package:eventra/features/client/client_bookings/presentation/widgets/enquiry_flow_vendor_card.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart' as intl;

class PendingEnquiryDetailPage extends StatelessWidget {
  const PendingEnquiryDetailPage({super.key});

  static const String path = '/pending-enquiry-detail';
  static const String name = 'pending-enquiry-detail';

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;
    final extra = GoRouterState.of(context).extra;
    if (extra is! EnquiryFlowDetailsArgs) {
      return const SizedBox.shrink();
    }
    final args = extra;
    final localeTag = Localizations.localeOf(context).toLanguageTag();
    final eventDate = intl.DateFormat.yMMMMEEEEd(
      localeTag,
    ).format(args.eventDate);

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).maybePop(),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: Text(
          l10n.enquiryFlowPendingTitle,
          style: 18.w600.copyWith(color: colorScheme.onSurface),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
              decoration: BoxDecoration(
                color: colorScheme.errorContainer.withValues(alpha: 0.25),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                l10n.enquiryFlowPendingBanner,
                textAlign: TextAlign.center,
                style: 17.w500.copyWith(color: colorScheme.primary),
              ),
            ),
            18.vertSpacing,
            EnquiryFlowVendorCard(
              vendorImage: args.vendor.image,
              vendorName: args.vendor.name,
              subtitle: args.vendor.category,
              ratingLabel: l10n.enquiryFlowPendingRating(
                '${args.vendor.rating}',
                args.vendor.reviewsCount,
              ),
              invoiceIdLabel: '${l10n.enquiryFlowInvoiceId}: ${args.invoiceId}',
              dateIssuedLabel:
                  '${l10n.enquiryFlowDateIssued}:'
                  ' ${intl.DateFormat.yMMMMd(localeTag).format(args.dateIssued)}',
              statusLabel: '${l10n.enquiryFlowStatus}: ',
              statusValue: l10n.notificationsFilterPending,
              statusColor: colorScheme.primary,
              onMessageVendor: () {
                GlobalSnackBar.showInfo(
                  l10n.notificationsContactVendorFeedback,
                );
              },
            ),
            26.vertSpacing,
            Text(
              l10n.enquiryFlowEventDetailsHeader,
              style: 20.w700.copyWith(color: colorScheme.onSurface),
            ),
            18.vertSpacing,
            EnquiryFlowDetailRow(
              label: l10n.enquiryFlowEventType,
              value: args.eventType,
            ),
            Divider(color: colorScheme.outline.withValues(alpha: 0.32)),
            EnquiryFlowDetailRow(
              label: l10n.enquiryFlowLocation,
              value: args.location,
            ),
            Divider(color: colorScheme.outline.withValues(alpha: 0.32)),
            EnquiryFlowDetailRow(
              label: l10n.enquiryFlowDate,
              value: eventDate,
            ),
            Divider(color: colorScheme.outline.withValues(alpha: 0.32)),
            EnquiryFlowDetailRow(
              label: l10n.enquiryFlowTime,
              value: args.eventTime,
            ),
            Divider(color: colorScheme.outline.withValues(alpha: 0.32)),
            16.vertSpacing,
            Text(
              l10n.enquiryFlowInspirationHeader,
              style: 16.w500.copyWith(color: colorScheme.onSurfaceVariant),
            ),
            10.vertSpacing,
            SizedBox(
              height: 112,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: args.inspirationImages.length,
                separatorBuilder: (context, index) => 10.horizSpacing,
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      args.inspirationImages[index],
                      width: 112,
                      height: 112,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
            24.vertSpacing,
            Text(
              l10n.enquiryFlowDeliverables,
              style: 18.w700.copyWith(color: colorScheme.onSurface),
            ),
            8.vertSpacing,
            Text(
              args.deliverables,
              style: 16.w400.copyWith(color: colorScheme.onSurfaceVariant),
            ),
            18.vertSpacing,
            Divider(
              color: colorScheme.onSurface.withValues(alpha: 0.9),
              height: 1,
            ),
            18.vertSpacing,
            Text(
              l10n.enquiryFlowTerms,
              style: 18.w700.copyWith(color: colorScheme.onSurface),
            ),
            8.vertSpacing,
            Text(
              args.termsAndConditions,
              style: 16.w400.copyWith(color: colorScheme.onSurfaceVariant),
            ),
          ],
        ),
      ),
    );
  }
}
