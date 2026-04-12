import 'package:eventra/core/utils/boxshadow_util.dart';
import 'package:eventra/core/utils/global_snackbar.dart';
import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/client_bookings/presentation/models/enquiry_flow_details_args.dart';
import 'package:eventra/features/client/client_bookings/presentation/widgets/enquiry_contract_bullet_item.dart';
import 'package:eventra/features/client/client_bookings/presentation/widgets/enquiry_contract_detail_row.dart';
import 'package:eventra/features/client/client_bookings/presentation/widgets/enquiry_contract_highlight_row.dart';
import 'package:eventra/features/client/client_bookings/presentation/widgets/enquiry_contract_party_card.dart';
import 'package:eventra/features/client/client_bookings/presentation/widgets/enquiry_contract_section.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/resources/resources.dart';
import 'package:eventra/shared/theme/color_schemes.dart';
import 'package:eventra/shared/widgets/eventra_buttons/eventra_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

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
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).maybePop(),
          icon: SvgPicture.asset(
            EventraVectors.angleRight,
            colorFilter: ColorFilter.mode(
              colorScheme.onSurface,
              BlendMode.srcIn,
            ),
          ),
        ),
        title: Text(
          l10n.enquiryFlowContractTitle,
          style: 16.w600.copyWith(color: colorScheme.onSurface),
        ),
        actions: [
          IconButton(
            onPressed: () =>
                GlobalSnackBar.showInfo(l10n.notificationsActionComingSoon),
            icon: SvgPicture.asset(
              EventraVectors.shareContractIcon,
              width: 20,
              height: 20,
              // colorFilter: ColorFilter.mode(
              //   colorScheme.onSurface,
              //   BlendMode.srcIn,
              // ),
            ),
          ),
          IconButton(
            onPressed: () =>
                GlobalSnackBar.showInfo(l10n.notificationsActionComingSoon),
            icon: SvgPicture.asset(
              EventraVectors.downloadContractIcon,
              width: 20,
              height: 20,
              // colorFilter: ColorFilter.mode(
              //   colorScheme.onSurfaceVariant,
              //   BlendMode.srcIn,
              // ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(12, 10, 12, 90),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: BorderRadius.circular(10),
                boxShadow: boxShadowLight,
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: 32,
                  top: 24,
                ),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        l10n.enquiryFlowContractHeader,
                        textAlign: TextAlign.center,
                        style: 27.w700.copyWith(color: colorScheme.primary),
                      ),
                    ),
                    2.vertSpacing,
                    Center(
                      child: Text(
                        l10n.enquiryFlowContractSubheader,
                        textAlign: TextAlign.center,
                        style: 22.w700.copyWith(color: colorScheme.onSurface),
                      ),
                    ),
                    Center(
                      child: Text(
                        l10n.enquiryFlowContractSubtitle,
                        textAlign: TextAlign.center,
                        style: 12.w400.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                    16.vertSpacing,
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: colorScheme.primaryContainer.withValues(
                          alpha: 0.2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        l10n.enquiryFlowContractNotice,
                        style: 12.w400.copyWith(color: colorScheme.primary),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            16.vertSpacing,
            EnquiryContractSection(
              number: 1,
              title: _extractSectionTitle(l10n.enquiryFlowContractParties),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  EnquiryContractPartyCard(
                    title: l10n.enquiryFlowContractVendorLabel,
                    firstLine: l10n.enquiryFlowContractVendorName(
                      args.vendor.name,
                    ),
                    secondLine: l10n.enquiryFlowContractVendorBusiness,
                    thirdLine: l10n.enquiryFlowContractVendorContact,
                  ),
                  10.vertSpacing,
                  Center(
                    child: Text(
                      l10n.enquiryFlowContractAnd,
                      style: 12.w500.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                  10.vertSpacing,
                  EnquiryContractPartyCard(
                    title: l10n.enquiryFlowContractClientLabel,
                    firstLine: l10n.enquiryFlowContractClientName,
                    secondLine: l10n.enquiryFlowContractClientContact,
                  ),
                  25.vertSpacing,
                  Center(
                    child: Text(
                      l10n.enquiryFlowContractFacilitator,
                      style: 12.w400.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            12.vertSpacing,
            EnquiryContractSection(
              number: 2,
              title: _extractSectionTitle(l10n.enquiryFlowContractEventDetails),
              child: Column(
                children: [
                  EnquiryContractDetailRow(
                    label: l10n.enquiryFlowEventType,
                    value: args.eventType,
                  ),
                  EnquiryContractDetailRow(
                    label: l10n.enquiryFlowDate,
                    value: DateFormat('MMMM d, y').format(args.eventDate),
                  ),
                  EnquiryContractDetailRow(
                    label: l10n.enquiryFlowLocation,
                    value: args.location,
                  ),
                  EnquiryContractDetailRow(
                    label: l10n.enquiryFlowContractServiceDescriptionLabel,
                    value: args.deliverables,
                    isStacked: true,
                  ),
                  EnquiryContractDetailRow(
                    label: l10n.enquiryFlowContractTotalAmount,
                    value: l10n.enquiryFlowContractTotalAmountValue,
                    emphasized: true,
                    showDivider: false,
                  ),
                ],
              ),
            ),
            12.vertSpacing,
            EnquiryContractSection(
              number: 3,
              title: _extractSectionTitle(l10n.enquiryFlowContractPaymentTerms),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.enquiryFlowContractPaymentTermLine1,
                    style: 13.w400.copyWith(color: colorScheme.onSurface),
                  ),
                  6.vertSpacing,
                  Text(
                    l10n.enquiryFlowContractPaymentTermLine2,
                    style: 13.w400.copyWith(color: colorScheme.onSurface),
                  ),
                  8.vertSpacing,
                  EnquiryContractHighlightRow(
                    label: l10n.enquiryFlowContractPaymentTermBooking,
                    value: l10n.enquiryFlowContractPaymentTermBookingAmount,
                    valueColor: AppColorSchemes.success,
                    highlightColor: AppColorSchemes.success,
                  ),
                  EnquiryContractHighlightRow(
                    label: l10n.enquiryFlowContractPaymentTermCompletion,
                    value: l10n.enquiryFlowContractPaymentTermCompletionAmount,
                    valueColor: colorScheme.primary,
                    highlightColor: colorScheme.primary,
                  ),
                  4.vertSpacing,
                  Text(
                    l10n.enquiryFlowContractPaymentTermLine3,
                    style: 13.w400.copyWith(color: colorScheme.onSurface),
                  ),
                  6.vertSpacing,
                  Text(
                    l10n.enquiryFlowContractPaymentTermLine4,
                    style: 13.w400.copyWith(color: colorScheme.onSurface),
                  ),
                ],
              ),
            ),
            12.vertSpacing,
            EnquiryContractSection(
              number: 4,
              title: _extractSectionTitle(
                l10n.enquiryFlowContractVendorObligations,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.enquiryFlowContractVendorObligationsLead,
                    style: 13.w400.copyWith(color: colorScheme.onSurface),
                  ),
                  8.vertSpacing,
                  EnquiryContractBulletItem(
                    text: l10n.enquiryFlowContractVendorDuty1,
                    icon: Icons.check,
                    iconColor: AppColorSchemes.success,
                  ),
                  EnquiryContractBulletItem(
                    text: l10n.enquiryFlowContractVendorDuty2,
                    icon: Icons.check,
                    iconColor: AppColorSchemes.success,
                  ),
                  EnquiryContractBulletItem(
                    text: l10n.enquiryFlowContractVendorDuty3,
                    icon: Icons.check,
                    iconColor: AppColorSchemes.success,
                  ),
                  EnquiryContractBulletItem(
                    text: l10n.enquiryFlowContractVendorDuty4,
                    icon: Icons.check,
                    iconColor: AppColorSchemes.success,
                  ),
                  EnquiryContractBulletItem(
                    text: l10n.enquiryFlowContractVendorDuty5,
                    icon: Icons.check,
                    iconColor: AppColorSchemes.success,
                  ),
                  EnquiryContractBulletItem(
                    text: l10n.enquiryFlowContractVendorDuty6,
                    icon: Icons.check,
                    iconColor: AppColorSchemes.success,
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: colorScheme.onSurface.withValues(alpha: 0.03),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: SvgPicture.asset(
                            EventraVectors.cautionSignOrange,
                            width: 14,
                            height: 14,
                            colorFilter: ColorFilter.mode(
                              colorScheme.onSurface,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                        6.horizSpacing,
                        Expanded(
                          child: Text(
                            l10n.enquiryFlowContractVendorWarning,
                            style: 13.w400.copyWith(
                              color: colorScheme.onSurface,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            12.vertSpacing,
            EnquiryContractSection(
              number: 5,
              title: _extractSectionTitle(
                l10n.enquiryFlowContractClientObligations,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.enquiryFlowContractClientObligationsLead,
                    style: 13.w400.copyWith(color: colorScheme.onSurface),
                  ),
                  8.vertSpacing,
                  EnquiryContractBulletItem(
                    text: l10n.enquiryFlowContractClientDuty1,
                    icon: Icons.check,
                    iconColor: colorScheme.primary,
                  ),
                  EnquiryContractBulletItem(
                    text: l10n.enquiryFlowContractClientDuty2,
                    icon: Icons.check,
                    iconColor: colorScheme.primary,
                  ),
                  EnquiryContractBulletItem(
                    text: l10n.enquiryFlowContractClientDuty3,
                    icon: Icons.check,
                    iconColor: colorScheme.primary,
                  ),
                  EnquiryContractBulletItem(
                    text: l10n.enquiryFlowContractClientDuty4,
                    icon: Icons.check,
                    iconColor: colorScheme.primary,
                  ),
                  EnquiryContractBulletItem(
                    text: l10n.enquiryFlowContractClientDuty5,
                    icon: Icons.check,
                    iconColor: colorScheme.primary,
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: colorScheme.primaryContainer.withValues(
                        alpha: 0.25,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: SvgPicture.asset(
                            EventraVectors.infoIcon,
                            colorFilter: ColorFilter.mode(
                              colorScheme.primary,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                        6.horizSpacing,
                        Expanded(
                          child: Text(
                            l10n.enquiryFlowContractClientWarning,
                            style: 13.w400.copyWith(color: colorScheme.primary),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            12.vertSpacing,
            EnquiryContractSection(
              number: 6,
              title: _extractSectionTitle(
                l10n.enquiryFlowContractCancellationPolicy,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.enquiryFlowContractCancellationClientTitle,
                    style: 14.w600.copyWith(color: colorScheme.onSurface),
                  ),
                  6.vertSpacing,
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: EnquiryContractBulletItem(
                      text: l10n.enquiryFlowContractCancellationClientLine1,
                      icon: Icons.circle,
                      iconColor: colorScheme.onSurfaceVariant,
                      iconSize: 7,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: EnquiryContractBulletItem(
                      text: l10n.enquiryFlowContractCancellationClientLine2,
                      icon: Icons.circle,
                      iconColor: colorScheme.onSurfaceVariant,
                      iconSize: 7,
                    ),
                  ),
                  2.vertSpacing,
                  Text(
                    l10n.enquiryFlowContractCancellationVendorTitle,
                    style: 14.w600.copyWith(color: colorScheme.onSurface),
                  ),
                  6.vertSpacing,
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: EnquiryContractBulletItem(
                      text: l10n.enquiryFlowContractCancellationVendorLine1,
                      icon: Icons.circle,
                      iconColor: colorScheme.onSurfaceVariant,
                      iconSize: 7,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: EnquiryContractBulletItem(
                      text: l10n.enquiryFlowContractCancellationVendorLine2,
                      icon: Icons.circle,
                      iconColor: colorScheme.onSurfaceVariant,
                      iconSize: 7,
                    ),
                  ),
                ],
              ),
            ),
            12.vertSpacing,
            EnquiryContractSection(
              number: 7,
              title: _extractSectionTitle(
                l10n.enquiryFlowContractDisputeResolution,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.enquiryFlowContractDisputeIntro,
                    style: 13.w400.copyWith(color: colorScheme.onSurface),
                  ),
                  8.vertSpacing,
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: EnquiryContractBulletItem(
                      text: l10n.enquiryFlowContractDisputeLine1,
                      icon: Icons.circle,
                      iconColor: colorScheme.onSurfaceVariant,
                      iconSize: 7,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: EnquiryContractBulletItem(
                      text: l10n.enquiryFlowContractDisputeLine2,
                      icon: Icons.circle,
                      iconColor: colorScheme.onSurfaceVariant,
                      iconSize: 7,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: EnquiryContractBulletItem(
                      text: l10n.enquiryFlowContractDisputeLine3,
                      icon: Icons.circle,
                      iconColor: colorScheme.onSurfaceVariant,
                      iconSize: 7,
                    ),
                  ),
                ],
              ),
            ),
            12.vertSpacing,
            EnquiryContractSection(
              number: 8,
              title: _extractSectionTitle(l10n.enquiryFlowContractAcceptance),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.enquiryFlowContractAcceptanceIntro,
                    style: 13.w400.copyWith(color: colorScheme.onSurface),
                  ),
                  8.vertSpacing,
                  Padding(
                    padding: const EdgeInsets.only(left: 14),
                    child: EnquiryContractBulletItem(
                      text: l10n.enquiryFlowContractAcceptanceLine1,
                      icon: Icons.circle,
                      iconColor: colorScheme.onSurfaceVariant,
                      iconSize: 7,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 14),
                    child: EnquiryContractBulletItem(
                      text: l10n.enquiryFlowContractAcceptanceLine2,
                      icon: Icons.circle,
                      iconColor: colorScheme.onSurfaceVariant,
                      iconSize: 7,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 14),
                    child: EnquiryContractBulletItem(
                      text: l10n.enquiryFlowContractAcceptanceLine3,
                      icon: Icons.circle,
                      iconColor: colorScheme.onSurfaceVariant,
                      iconSize: 7,
                    ),
                  ),
                ],
              ),
            ),
            12.vertSpacing,
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              decoration: BoxDecoration(
                color: colorScheme.onSurface.withValues(alpha: 0.04),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Text(
                    l10n.enquiryFlowContractMetaId,
                    textAlign: TextAlign.center,
                    style: 12.w500.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  4.vertSpacing,
                  Text(
                    l10n.enquiryFlowContractMetaGenerated,
                    textAlign: TextAlign.center,
                    style: 12.w500.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  4.vertSpacing,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        EventraVectors.secureHalfOrgangeIconContract,
                        width: 14,
                        height: 14,
                        colorFilter: ColorFilter.mode(
                          colorScheme.primary,
                          BlendMode.srcIn,
                        ),
                      ),
                      8.horizSpacing,
                      Text(
                        l10n.enquiryFlowContractMetaSecured,
                        textAlign: TextAlign.center,
                        style: 11.w500.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            12.vertSpacing,
            standardDividerUtil(context),
          ],
        ),
      ),
      bottomSheet: SafeArea(
        child: Container(
          color: colorScheme.surface,
          padding: const EdgeInsets.fromLTRB(18, 10, 18, 20),
          child: Row(
            children: [
              Expanded(
                flex: 6,
                child: EventraButton.withIcon(
                  height: 50,
                  icon: EventraVectors.checkSingleWhite,
                  padding: EdgeInsets.zero,
                  buttonText: l10n.enquiryFlowContractAccept,
                  borderRadius: 10,
                  onPressed: () async {
                    GlobalSnackBar.showSuccess(
                      l10n.enquiryFlowContractAcceptedFeedback,
                    );
                    await Navigator.of(context).maybePop();
                  },
                ),
              ),
              8.horizSpacing,
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: FilledButton.tonal(
                    onPressed: () => Navigator.of(context).maybePop(),
                    style: FilledButton.styleFrom(
                      backgroundColor: colorScheme.surface,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: colorScheme.onSurfaceVariant),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                    ),
                    child: const Icon(Icons.close_rounded),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _extractSectionTitle(String source) {
    final split = source.split('  ');
    if (split.length < 2) {
      return source;
    }
    return split.sublist(1).join('  ');
  }
}
