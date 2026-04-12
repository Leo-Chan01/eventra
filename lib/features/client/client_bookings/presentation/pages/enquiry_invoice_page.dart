import 'package:eventra/core/utils/global_snackbar.dart';
import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/client_bookings/presentation/models/enquiry_flow_details_args.dart';
import 'package:eventra/features/client/client_bookings/presentation/widgets/enquiry_invoice_line_item.dart';
import 'package:eventra/features/client/client_bookings/presentation/widgets/enquiry_invoice_summary_row.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/shared/widgets/eventra_buttons/eventra_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart' as intl;

class EnquiryInvoicePage extends StatelessWidget {
  const EnquiryInvoicePage({super.key});

  static const String path = '/enquiry-invoice';
  static const String name = 'enquiry-invoice';

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
    final amountLabel = intl.NumberFormat.currency(
      locale: localeTag,
      symbol: '₦',
      decimalDigits: 0,
    ).format(args.amount);

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).maybePop(),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: Text(
          l10n.enquiryFlowInvoiceScreenTitle,
          style: 18.w600.copyWith(color: colorScheme.onSurface),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: colorScheme.primary,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(8),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l10n.enquiryFlowInvoiceLabel,
                          style: 28.w700.copyWith(color: colorScheme.onPrimary),
                        ),
                        12.vertSpacing,
                        Text(
                          l10n.enquiryFlowInvoiceNumberLabel,
                          style: 17.w400.copyWith(color: colorScheme.onPrimary),
                        ),
                        4.vertSpacing,
                        Text(
                          args.invoiceId,
                          style: 17.w500.copyWith(color: colorScheme.onPrimary),
                        ),
                        12.vertSpacing,
                        Text(
                          l10n.enquiryFlowDate,
                          style: 17.w400.copyWith(color: colorScheme.onPrimary),
                        ),
                        4.vertSpacing,
                        Text(
                          intl.DateFormat.yMMMMd(
                            localeTag,
                          ).format(args.dateIssued),
                          style: 17.w500.copyWith(color: colorScheme.onPrimary),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(14, 16, 14, 16),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(999),
                              child: Image.asset(
                                args.vendor.image,
                                width: 46,
                                height: 46,
                                fit: BoxFit.cover,
                              ),
                            ),
                            10.horizSpacing,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    l10n.enquiryFlowVendorLabel(
                                      args.vendor.name,
                                    ),
                                    style: 15.w500.copyWith(
                                      color: colorScheme.onSurface,
                                    ),
                                  ),
                                  4.vertSpacing,
                                  Text(
                                    l10n.enquiryFlowLocationLabel(
                                      args.vendor.location,
                                    ),
                                    style: 15.w400.copyWith(
                                      color: colorScheme.onSurfaceVariant,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        14.vertSpacing,
                        Container(
                          color: colorScheme.surfaceContainerHighest.withValues(
                            alpha: 0.55,
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 12,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  l10n.enquiryFlowInvoiceItemName,
                                  style: 14.w600,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  l10n.enquiryFlowInvoiceQty,
                                  textAlign: TextAlign.center,
                                  style: 14.w600,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  l10n.enquiryFlowInvoiceRate,
                                  textAlign: TextAlign.center,
                                  style: 14.w600,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  l10n.enquiryFlowInvoiceAmount,
                                  textAlign: TextAlign.end,
                                  style: 14.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        EnquiryInvoiceLineItem(
                          itemName: l10n.enquiryFlowInvoiceSampleItem,
                          quantity: '4',
                          rate: '2,000',
                          amount: '1,000,000',
                        ),
                        EnquiryInvoiceLineItem(
                          itemName: l10n.enquiryFlowInvoiceSampleItem,
                          quantity: '4',
                          rate: '2,000',
                          amount: '1,000,000',
                        ),
                        EnquiryInvoiceLineItem(
                          itemName: l10n.enquiryFlowInvoiceSampleItem,
                          quantity: '4',
                          rate: '2,000',
                          amount: '1,000,000',
                        ),
                        Divider(
                          color: colorScheme.outline.withValues(alpha: 0.35),
                          thickness: 1,
                          height: 28,
                        ),
                        EnquiryInvoiceSummaryRow(
                          label: l10n.enquiryFlowInvoiceSubtotal,
                          value: amountLabel,
                        ),
                        10.vertSpacing,
                        EnquiryInvoiceSummaryRow(
                          label: l10n.enquiryFlowInvoiceDiscount,
                          value:
                              '-${intl.NumberFormat.currency(
                                locale: localeTag,
                                symbol: '₦',
                                decimalDigits: 0,
                              ).format(args.amount * 0.1)}',
                        ),
                        10.vertSpacing,
                        EnquiryInvoiceSummaryRow(
                          label: l10n.enquiryFlowInvoiceVat,
                          value: intl.NumberFormat.currency(
                            locale: localeTag,
                            symbol: '₦',
                            decimalDigits: 0,
                          ).format(args.amount * 0.02),
                        ),
                        10.vertSpacing,
                        EnquiryInvoiceSummaryRow(
                          label: l10n.enquiryFlowInvoiceTotal,
                          value:
                              intl.NumberFormat.currency(
                                locale: localeTag,
                                symbol: '₦',
                                decimalDigits: 0,
                              ).format(
                                (args.amount - (args.amount * 0.1)) +
                                    (args.amount * 0.02),
                              ),
                          emphasized: true,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            22.vertSpacing,
            Text(
              l10n.enquiryFlowDeliverables,
              style: 17.w700.copyWith(color: colorScheme.onSurface),
            ),
            8.vertSpacing,
            Text(
              args.deliverables,
              style: 16.w400.copyWith(color: colorScheme.onSurfaceVariant),
            ),
            18.vertSpacing,
            Divider(
              color: colorScheme.outline.withValues(alpha: 0.35),
              thickness: 1,
            ),
            16.vertSpacing,
            Text(
              l10n.enquiryFlowTerms,
              style: 17.w700.copyWith(color: colorScheme.onSurface),
            ),
            8.vertSpacing,
            Text(
              args.termsAndConditions,
              style: 16.w400.copyWith(color: colorScheme.onSurfaceVariant),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 18),
        child: EventraButton(
          buttonText: l10n.enquiryFlowBack,
          onPressed: () => Navigator.of(context).maybePop(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            GlobalSnackBar.showInfo(l10n.notificationsActionComingSoon),
        backgroundColor: colorScheme.surface,
        child: Icon(Icons.download_outlined, color: colorScheme.onSurface),
      ),
    );
  }
}
