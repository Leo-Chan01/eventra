import 'package:eventra/core/utils/global_snackbar.dart';
import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/client_bookings/presentation/models/enquiry_flow_details_args.dart';
import 'package:eventra/features/client/client_bookings/presentation/widgets/enquiry_flow_detail_row.dart';
import 'package:eventra/features/client/client_bookings/presentation/widgets/enquiry_flow_vendor_card.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/shared/widgets/eventra_buttons/eventra_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart' as intl;

class ActiveEnquiryDetailPage extends StatelessWidget {
  const ActiveEnquiryDetailPage({super.key});

  static const String path = '/active-enquiry-detail';
  static const String name = 'active-enquiry-detail';

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
    final amountPaid = intl.NumberFormat.currency(
      locale: localeTag,
      symbol: '₦',
      decimalDigits: 2,
    ).format(args.amount);

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 30, 16, 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  l10n.enquiryFlowJobOngoingTitle,
                  style: 40.w700.copyWith(color: colorScheme.onSurface),
                ),
              ),
              10.vertSpacing,
              Center(
                child: Text(
                  l10n.enquiryFlowPaymentReceivedBody,
                  style: 18.w400.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    height: 1.4,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              26.vertSpacing,
              EnquiryFlowVendorCard(
                vendorImage: args.vendor.image,
                vendorName: args.vendor.name,
                invoiceIdLabel:
                    '${l10n.enquiryFlowInvoiceId}: ${args.invoiceId}',
                dateIssuedLabel:
                    '${l10n.enquiryFlowDateIssued}: '
                    '${intl.DateFormat.yMMMMd(localeTag).format(args.dateIssued)}',
                statusLabel: '${l10n.enquiryFlowStatus}: ',
                statusValue: l10n.homeEnquiryStatusActive,
                statusColor: colorScheme.tertiary,
                onMessageVendor: () {
                  GlobalSnackBar.showInfo(
                    l10n.notificationsContactVendorFeedback,
                  );
                },
              ),
              14.vertSpacing,
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  color: colorScheme.surface,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  children: [
                    EnquiryFlowDetailRow(
                      label: l10n.enquiryFlowEventType,
                      value: args.eventType,
                    ),
                    Divider(color: colorScheme.outline.withValues(alpha: 0.3)),
                    EnquiryFlowDetailRow(
                      label: l10n.completedEnquiryAmountPaidLabel,
                      value: amountPaid,
                      valueColor: colorScheme.primary,
                      valueWeight: FontWeight.w700,
                    ),
                    Divider(color: colorScheme.outline.withValues(alpha: 0.3)),
                    EnquiryFlowDetailRow(
                      label: l10n.enquiryFlowDate,
                      value: intl.DateFormat.yMMMEd(
                        localeTag,
                      ).format(args.eventDate),
                    ),
                    Divider(color: colorScheme.outline.withValues(alpha: 0.3)),
                    EnquiryFlowDetailRow(
                      label: l10n.completedEnquiryBookingReferenceLabel,
                      value: args.bookingReferenceId,
                    ),
                  ],
                ),
              ),
              24.vertSpacing,
              EventraButton(
                buttonText: l10n.enquiryFlowBack,
                onPressed: () => Navigator.of(context).maybePop(),
              ),
              14.vertSpacing,
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
      ),
    );
  }
}
