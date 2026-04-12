import 'dart:async';

import 'package:eventra/core/utils/global_snackbar.dart';
import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/client_bookings/presentation/models/enquiry_flow_details_args.dart';
import 'package:eventra/features/client/client_bookings/presentation/pages/enquiry_contract_page.dart';
import 'package:eventra/features/client/client_bookings/presentation/pages/enquiry_invoice_page.dart';
import 'package:eventra/features/client/client_bookings/presentation/pages/payment_received_page.dart';
import 'package:eventra/features/client/client_bookings/presentation/widgets/enquiry_flow_vendor_card.dart';
import 'package:eventra/features/client/client_bookings/presentation/widgets/enquiry_invoice_preview_table.dart';
import 'package:eventra/features/client/client_bookings/presentation/widgets/enquiry_payment_bottom_sheet.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/shared/theme/color_schemes.dart';
import 'package:eventra/shared/widgets/eventra_buttons/eventra_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart' as intl;

class AwaitingPaymentEnquiryPage extends StatelessWidget {
  const AwaitingPaymentEnquiryPage({super.key});

  static const String path = '/awaiting-payment-enquiry';
  static const String name = 'awaiting-payment-enquiry';

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
    final issuedDate = intl.DateFormat.yMMMMd(
      localeTag,
    ).format(args.dateIssued);
    final amountLabel = intl.NumberFormat.currency(
      locale: localeTag,
      symbol: '₦',
      decimalDigits: 2,
    ).format(args.amount);

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).maybePop(),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: Text(
          l10n.enquiryFlowAwaitingTitle,
          style: 18.w600.copyWith(color: colorScheme.onSurface),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: EnquiryFlowVendorCard(
                vendorImage: args.vendor.image,
                vendorName: args.vendor.name,
                invoiceIdLabel:
                    '${l10n.enquiryFlowInvoiceId}: ${args.invoiceId}',
                dateIssuedLabel: '${l10n.enquiryFlowDateIssued}: $issuedDate',
                statusLabel: '${l10n.enquiryFlowStatus}: ',
                statusValue: l10n.homeEnquiryStatusAwaitingPayment,
                statusColor: colorScheme.primary,
                onMessageVendor: () {
                  GlobalSnackBar.showInfo(
                    l10n.notificationsContactVendorFeedback,
                  );
                },
              ),
            ),
            16.vertSpacing,
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.fromLTRB(14, 16, 14, 16),
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.enquiryFlowInvoicePreviewTitle,
                    style: 20.w700.copyWith(color: colorScheme.onSurface),
                  ),
                  10.vertSpacing,
                  Text(
                    l10n.enquiryFlowInvoicePreviewNumber(args.invoiceId),
                    style: 16.w400.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  6.vertSpacing,
                  Text(
                    l10n.enquiryFlowInvoicePreviewDate(issuedDate),
                    style: 16.w400.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  12.vertSpacing,
                  Divider(color: colorScheme.outline.withValues(alpha: 0.35)),
                  12.vertSpacing,
                  EnquiryInvoicePreviewTable(
                    args: args,
                    amountLabel: amountLabel,
                  ),
                  14.vertSpacing,
                  Center(
                    child: EventraButton.smallBorder(
                      width: 170,
                      buttonText: l10n.enquiryFlowViewInvoice,
                      onPressed: () async {
                        await context.pushNamed(
                          EnquiryInvoicePage.name,
                          extra: args,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            18.vertSpacing,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColorSchemes.goldStar.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: AppColorSchemes.goldStar.withValues(alpha: 0.3),
                  ),
                ),
                child: RichText(
                  text: TextSpan(
                    text: l10n.enquiryFlowWhatHappensNext,
                    style: 17.w700.copyWith(color: colorScheme.secondary),
                    children: [
                      TextSpan(
                        text: l10n.enquiryFlowWhatHappensNextBody,
                        style: 17.w400.copyWith(color: colorScheme.secondary),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            20.vertSpacing,
            TextButton(
              onPressed: () async {
                await context.pushNamed(
                  EnquiryContractPage.name,
                  extra: args,
                );
              },
              child: Text(
                l10n.enquiryFlowViewContract,
                style: 16.w600.copyWith(color: colorScheme.onSurface),
              ),
            ),
            22.vertSpacing,
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 22),
        child: EventraButton(
          buttonText: l10n.enquiryFlowMakePayment,
          onPressed: () async {
            await EnquiryPaymentBottomSheet.show(
              context,
              amountLabel: amountLabel,
              onContinue: () {
                unawaited(Navigator.of(context).maybePop());
                unawaited(
                  context.pushNamed(
                    PaymentReceivedPage.name,
                    extra: args,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
