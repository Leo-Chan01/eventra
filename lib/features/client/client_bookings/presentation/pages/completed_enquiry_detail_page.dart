import 'package:eventra/core/utils/boxshadow_util.dart';
import 'package:eventra/core/utils/global_snackbar.dart';
import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/client_bookings/presentation/widgets/completed_enquiry_detail_row.dart';
import 'package:eventra/features/client/client_bookings/presentation/widgets/completed_enquiry_vendor_summary_card.dart';
import 'package:eventra/features/client/client_bookings/presentation/widgets/send_review_bottom_sheet.dart';
import 'package:eventra/features/home/domain/models/vendor.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/shared/theme/color_schemes.dart';
import 'package:eventra/shared/widgets/eventra_buttons/eventra_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart' as intl;

class CompletedEnquiryDetailPageArgs {
  const CompletedEnquiryDetailPageArgs({
    required this.vendor,
    required this.invoiceId,
    required this.bookingReferenceId,
    required this.amountPaid,
    required this.dateIssued,
    required this.eventDate,
  });

  final Vendor vendor;
  final String invoiceId;
  final String bookingReferenceId;
  final double amountPaid;
  final DateTime dateIssued;
  final DateTime eventDate;
}

class CompletedEnquiryDetailPage extends StatelessWidget {
  const CompletedEnquiryDetailPage({super.key});

  static const String path = '/completed-enquiry-detail';
  static const String name = 'completed-enquiry-detail';

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;
    final args =
        GoRouterState.of(context).extra as CompletedEnquiryDetailPageArgs;
    final localeTag = Localizations.localeOf(context).toLanguageTag();
    final issuedDate = intl.DateFormat.yMMMMd(
      localeTag,
    ).format(args.dateIssued);
    final eventDate = intl.DateFormat.yMMMEd(localeTag).format(args.eventDate);
    final amountPaid = intl.NumberFormat.currency(
      locale: localeTag,
      symbol: '₦',
      decimalDigits: 2,
    ).format(args.amountPaid);

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).maybePop(),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: Text(
          l10n.completedEnquiryPageTitle,
          style: 18.w500.copyWith(color: colorScheme.onSurface),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
        child: Column(
          children: [
            CompletedEnquiryVendorSummaryCard(
              vendorImage: args.vendor.image,
              vendorName: args.vendor.name,
              invoiceIdLabel:
                  '${l10n.completedEnquiryInvoiceIdLabel}: ${args.invoiceId}',
              dateIssuedLabel:
                  '${l10n.completedEnquiryDateIssuedLabel}: $issuedDate',
              statusPrefix: '${l10n.completedEnquiryStatusLabel}: ',
              statusLabel: l10n.homeEnquiryStatusActive,
              statusColor: AppColorSchemes.success,
              onMessageVendor: () {
                GlobalSnackBar.showInfo(
                  l10n.notificationsContactVendorFeedback,
                );
              },
            ),
            20.vertSpacing,
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 18),
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: BorderRadius.circular(18),
                boxShadow: boxShadowLight,
              ),
              child: Column(
                children: [
                  CompletedEnquiryDetailRow(
                    label: l10n.completedEnquiryEventTypeLabel,
                    value: args.vendor.category,
                  ),
                  Divider(color: colorScheme.outline.withValues(alpha: 0.2)),
                  CompletedEnquiryDetailRow(
                    label: l10n.completedEnquiryAmountPaidLabel,
                    value: amountPaid,
                    valueColor: colorScheme.primary,
                    isEmphasizedValue: true,
                  ),
                  Divider(color: colorScheme.outline.withValues(alpha: 0.2)),
                  CompletedEnquiryDetailRow(
                    label: l10n.completedEnquiryDateLabel,
                    value: eventDate,
                  ),
                  Divider(color: colorScheme.outline.withValues(alpha: 0.2)),
                  CompletedEnquiryDetailRow(
                    label: l10n.completedEnquiryBookingReferenceLabel,
                    value: args.bookingReferenceId,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            EventraButton(
              buttonText: l10n.completedEnquirySendReviews,
              onPressed: () async {
                await SendReviewBottomSheet.show(
                  context,
                  vendorName: args.vendor.name,
                  vendorImage: args.vendor.image,
                );
              },
            ),
            16.vertSpacing,
            EventraButton.outlined(
              buttonText: l10n.completedEnquiryReportVendor,
              textColor: colorScheme.error,
              borderColor: colorScheme.error,
              onPressed: () {
                GlobalSnackBar.showInfo(l10n.notificationsActionComingSoon);
              },
            ),
          ],
        ),
      ),
    );
  }
}
