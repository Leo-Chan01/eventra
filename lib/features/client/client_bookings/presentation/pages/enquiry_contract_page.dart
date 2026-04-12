import 'dart:async';

import 'package:eventra/core/utils/global_snackbar.dart';
import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/client_bookings/presentation/models/enquiry_flow_details_args.dart';
import 'package:eventra/features/client/client_bookings/presentation/widgets/enquiry_contract_detail_row.dart';
import 'package:eventra/features/client/client_bookings/presentation/widgets/enquiry_contract_section.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/shared/widgets/eventra_buttons/eventra_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EnquiryContractPage extends StatelessWidget {
  const EnquiryContractPage({super.key});

  static const String path = '/enquiry-contract';
  static const String name = 'enquiry-contract';

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;
    final extra = GoRouterState.of(context).extra;
    if (extra is! EnquiryFlowDetailsArgs) {
      return const SizedBox.shrink();
    }
    final args = extra;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).maybePop(),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: Text(
          l10n.enquiryFlowContractTitle,
          style: 18.w600.copyWith(color: colorScheme.onSurface),
        ),
        actions: [
          IconButton(
            onPressed: () =>
                GlobalSnackBar.showInfo(l10n.notificationsActionComingSoon),
            icon: const Icon(Icons.reply_rounded),
          ),
          IconButton(
            onPressed: () =>
                GlobalSnackBar.showInfo(l10n.notificationsActionComingSoon),
            icon: const Icon(Icons.download_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(12, 10, 12, 120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                l10n.enquiryFlowContractHeader,
                textAlign: TextAlign.center,
                style: 30.w700.copyWith(color: colorScheme.primary),
              ),
            ),
            2.vertSpacing,
            Center(
              child: Text(
                l10n.enquiryFlowContractSubheader,
                textAlign: TextAlign.center,
                style: 26.w700.copyWith(color: colorScheme.onSurface),
              ),
            ),
            Center(
              child: Text(
                l10n.enquiryFlowContractSubtitle,
                textAlign: TextAlign.center,
                style: 14.w400.copyWith(color: colorScheme.onSurfaceVariant),
              ),
            ),
            16.vertSpacing,
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: colorScheme.errorContainer.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                l10n.enquiryFlowContractNotice,
                style: 13.w400.copyWith(color: colorScheme.primary),
              ),
            ),
            16.vertSpacing,
            EnquiryContractSection(
              title: l10n.enquiryFlowContractParties,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l10n.enquiryFlowContractVendorLabel, style: 16.w600),
                  6.vertSpacing,
                  Text(
                    l10n.enquiryFlowContractVendorName(args.vendor.name),
                    style: 14.w400,
                  ),
                  Text(l10n.enquiryFlowContractVendorBusiness, style: 14.w400),
                  Text(l10n.enquiryFlowContractVendorContact, style: 14.w400),
                  10.vertSpacing,
                  Center(
                    child: Text(
                      l10n.enquiryFlowContractAnd,
                      style: 13.w500.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                  10.vertSpacing,
                  Text(l10n.enquiryFlowContractClientLabel, style: 16.w600),
                  6.vertSpacing,
                  Text(l10n.enquiryFlowContractClientName, style: 14.w400),
                  Text(l10n.enquiryFlowContractClientContact, style: 14.w400),
                ],
              ),
            ),
            12.vertSpacing,
            EnquiryContractSection(
              title: l10n.enquiryFlowContractEventDetails,
              child: Column(
                children: [
                  EnquiryContractDetailRow(
                    label: l10n.enquiryFlowEventType,
                    value: args.eventType,
                  ),
                  EnquiryContractDetailRow(
                    label: l10n.enquiryFlowDate,
                    value:
                        '${args.eventDate.day}/${args.eventDate.month}/${args.eventDate.year}',
                  ),
                  EnquiryContractDetailRow(
                    label: l10n.enquiryFlowLocation,
                    value: args.location,
                  ),
                  EnquiryContractDetailRow(
                    label: l10n.enquiryFlowContractServiceDescriptionLabel,
                    value: args.deliverables,
                  ),
                  EnquiryContractDetailRow(
                    label: l10n.enquiryFlowContractTotalAmount,
                    value: l10n.enquiryFlowContractTotalAmountValue,
                    emphasized: true,
                  ),
                ],
              ),
            ),
            12.vertSpacing,
            EnquiryContractSection(
              title: l10n.enquiryFlowContractPaymentTerms,
              child: Text(
                l10n.enquiryFlowContractPaymentTermsBody,
                style: 14.w400.copyWith(color: colorScheme.onSurface),
              ),
            ),
            12.vertSpacing,
            EnquiryContractSection(
              title: l10n.enquiryFlowContractVendorObligations,
              child: Text(
                l10n.enquiryFlowContractVendorObligationsBody,
                style: 14.w400.copyWith(color: colorScheme.onSurface),
              ),
            ),
            12.vertSpacing,
            EnquiryContractSection(
              title: l10n.enquiryFlowContractClientObligations,
              child: Text(
                l10n.enquiryFlowContractClientObligationsBody,
                style: 14.w400.copyWith(color: colorScheme.onSurface),
              ),
            ),
            12.vertSpacing,
            EnquiryContractSection(
              title: l10n.enquiryFlowContractCancellationPolicy,
              child: Text(
                l10n.enquiryFlowContractCancellationPolicyBody,
                style: 14.w400.copyWith(color: colorScheme.onSurface),
              ),
            ),
            12.vertSpacing,
            EnquiryContractSection(
              title: l10n.enquiryFlowContractDisputeResolution,
              child: Text(
                l10n.enquiryFlowContractDisputeResolutionBody,
                style: 14.w400.copyWith(color: colorScheme.onSurface),
              ),
            ),
            12.vertSpacing,
            EnquiryContractSection(
              title: l10n.enquiryFlowContractAcceptance,
              child: Text(
                l10n.enquiryFlowContractAcceptanceBody,
                style: 14.w400.copyWith(color: colorScheme.onSurface),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: SafeArea(
        child: Container(
          color: colorScheme.surface,
          padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
          child: Row(
            children: [
              Expanded(
                child: EventraButton.smallBorder(
                  buttonText: l10n.enquiryFlowContractAccept,
                  onPressed: () {
                    GlobalSnackBar.showSuccess(
                      l10n.enquiryFlowContractAcceptedFeedback,
                    );
                    unawaited(Navigator.of(context).maybePop());
                  },
                ),
              ),
              8.horizSpacing,
              SizedBox(
                width: 58,
                child: FilledButton.tonal(
                  onPressed: () => Navigator.of(context).maybePop(),
                  child: const Icon(Icons.close_rounded),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
