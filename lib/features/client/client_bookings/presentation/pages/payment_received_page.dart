//
// ignore_for_file: lines_longer_than_80_chars

import 'package:eventra/core/utils/global_snackbar.dart';
import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/client_bookings/presentation/models/enquiry_flow_details_args.dart';
import 'package:eventra/features/client/client_bookings/presentation/widgets/enquiry_flow_detail_row.dart';
import 'package:eventra/features/client/client_bookings/presentation/widgets/enquiry_flow_vendor_card.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/resources/resources.dart';
import 'package:eventra/shared/theme/color_schemes.dart';
import 'package:eventra/shared/widgets/eventra_buttons/eventra_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart' as intl;

class PaymentReceivedPage extends StatelessWidget {
  const PaymentReceivedPage({super.key});

  static const String path = '/payment-received';
  static const String name = 'payment-received';

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
          padding: const EdgeInsets.fromLTRB(16, 28, 16, 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SvgPicture.asset(
                  EventraVectors.goodCheckGreenDottedCircle,
                  width: 114,
                  height: 114,
                ),
              ),
              30.vertSpacing,
              Center(
                child: Text(
                  l10n.enquiryFlowPaymentReceivedTitle,
                  style: 24.w700.copyWith(color: colorScheme.onSurface),
                  textAlign: TextAlign.center,
                ),
              ),
              12.vertSpacing,
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    l10n.enquiryFlowPaymentReceivedBody,
                    textAlign: TextAlign.center,
                    style: 14.w400.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      height: 1.45,
                    ),
                  ),
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
                statusColor: AppColorSchemes.success,
                onMessageVendor: () {
                  GlobalSnackBar.showInfo(
                    l10n.notificationsContactVendorFeedback,
                  );
                },
              ),
              16.vertSpacing,
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: colorScheme.surface,
                  borderRadius: BorderRadius.circular(14),
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
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
        child: EventraButton(
          buttonText: l10n.enquiryFlowBackToEnquiry,
          onPressed: () async {
            context
              ..pop()
              ..pop();
          },
        ),
      ),
    );
  }
}
