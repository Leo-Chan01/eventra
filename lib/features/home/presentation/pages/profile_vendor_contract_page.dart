import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/home/presentation/bloc/home_bloc.dart';
import 'package:eventra/features/home/presentation/widgets/profile_bullet_row.dart';
import 'package:eventra/features/home/presentation/widgets/profile_contract_detail_row.dart';
import 'package:eventra/features/home/presentation/widgets/profile_detail_header_card.dart';
import 'package:eventra/features/home/presentation/widgets/profile_surface_card.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileVendorContractPage extends StatelessWidget {
  const ProfileVendorContractPage({super.key});

  static const String path = '/profile-vendor-contract';
  static const String name = 'profile-vendor-contract';

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;
    final profile = context.read<HomeBloc>().state.profile;

    return Scaffold(
      key: const Key('profile_vendor_contract_page'),
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.of(context).maybePop(),
          icon: SvgPicture.asset(
            EventraVectors.angleRight,
            width: 18,
            height: 18,
            colorFilter: ColorFilter.mode(
              colorScheme.onSurface,
              BlendMode.srcIn,
            ),
          ),
        ),
        title: Text(
          l10n.homeProfileViewVendorContract,
          style: 18.w600.copyWith(color: colorScheme.onSurface),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileDetailHeaderCard.withRows(
              iconPath: EventraVectors.viewVendorsContract,
              title: l10n.enquiryFlowContractTitle,
              subtitle: l10n.enquiryFlowContractSubtitle,
              footerText: profile.memberSince,
            ),
            16.vertSpacing,
            ProfileSurfaceCard(
              backgroundColor: colorScheme.primaryContainer.withValues(
                alpha: 0.35,
              ),
              borderColor: colorScheme.primary.withValues(alpha: 0.35),
              child: Text(
                l10n.enquiryFlowContractNotice,
                style: 15.w500.copyWith(
                  color: colorScheme.primary,
                  height: 1.55,
                ),
              ),
            ),
            16.vertSpacing,
            ProfileSurfaceCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.enquiryFlowContractVendorLabel,
                    style: 16.w700.copyWith(color: colorScheme.onSurface),
                  ),
                  14.vertSpacing,
                  ProfileContractDetailRow(
                    label: l10n.homeProfileFullNameLabel,
                    value: profile.fullName,
                  ),
                  ProfileContractDetailRow(
                    label: l10n.homeProfileEmailLabel,
                    value: profile.email,
                  ),
                  ProfileContractDetailRow(
                    label: l10n.homeProfilePhoneNumberLabel,
                    value: profile.phoneNumber,
                  ),
                  ProfileContractDetailRow(
                    label: l10n.homeProfileAddressLabel,
                    value: profile.address,
                    showDivider: false,
                  ),
                ],
              ),
            ),
            16.vertSpacing,
            ProfileSurfaceCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.enquiryFlowContractVendorObligations,
                    style: 16.w700.copyWith(color: colorScheme.onSurface),
                  ),
                  12.vertSpacing,
                  Text(
                    l10n.enquiryFlowContractVendorObligationsBody,
                    style: 14.w400.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      height: 1.5,
                    ),
                  ),
                  14.vertSpacing,
                  ProfileBulletRow(
                    text: l10n.enquiryFlowContractVendorDuty1,
                    leading: Text(
                      '•',
                      style: 16.w700.copyWith(color: colorScheme.onSurface),
                    ),
                    color: colorScheme.onSurface,
                  ),
                  10.vertSpacing,
                  ProfileBulletRow(
                    text: l10n.enquiryFlowContractVendorDuty2,
                    leading: Text(
                      '•',
                      style: 16.w700.copyWith(color: colorScheme.onSurface),
                    ),
                    color: colorScheme.onSurface,
                  ),
                  10.vertSpacing,
                  ProfileBulletRow(
                    text: l10n.enquiryFlowContractVendorDuty3,
                    leading: Text(
                      '•',
                      style: 16.w700.copyWith(color: colorScheme.onSurface),
                    ),
                    color: colorScheme.onSurface,
                  ),
                  10.vertSpacing,
                  ProfileBulletRow(
                    text: l10n.enquiryFlowContractVendorDuty4,
                    leading: Text(
                      '•',
                      style: 16.w700.copyWith(color: colorScheme.onSurface),
                    ),
                    color: colorScheme.onSurface,
                  ),
                  10.vertSpacing,
                  ProfileBulletRow(
                    text: l10n.enquiryFlowContractVendorDuty5,
                    leading: Text(
                      '•',
                      style: 16.w700.copyWith(color: colorScheme.onSurface),
                    ),
                    color: colorScheme.onSurface,
                  ),
                  10.vertSpacing,
                  ProfileBulletRow(
                    text: l10n.enquiryFlowContractVendorDuty6,
                    leading: Text(
                      '•',
                      style: 16.w700.copyWith(color: colorScheme.onSurface),
                    ),
                    color: colorScheme.onSurface,
                  ),
                ],
              ),
            ),
            16.vertSpacing,
            ProfileSurfaceCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.enquiryFlowContractDisputeResolution,
                    style: 16.w700.copyWith(color: colorScheme.onSurface),
                  ),
                  12.vertSpacing,
                  Text(
                    l10n.enquiryFlowContractDisputeResolutionBody,
                    style: 14.w400.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      height: 1.5,
                    ),
                  ),
                  14.vertSpacing,
                  ProfileBulletRow(
                    text: l10n.enquiryFlowContractDisputeLine1,
                    leading: Text(
                      '•',
                      style: 16.w700.copyWith(color: colorScheme.onSurface),
                    ),
                    color: colorScheme.onSurface,
                  ),
                  10.vertSpacing,
                  ProfileBulletRow(
                    text: l10n.enquiryFlowContractDisputeLine2,
                    leading: Text(
                      '•',
                      style: 16.w700.copyWith(color: colorScheme.onSurface),
                    ),
                    color: colorScheme.onSurface,
                  ),
                  10.vertSpacing,
                  ProfileBulletRow(
                    text: l10n.enquiryFlowContractDisputeLine3,
                    leading: Text(
                      '•',
                      style: 16.w700.copyWith(color: colorScheme.onSurface),
                    ),
                    color: colorScheme.onSurface,
                  ),
                ],
              ),
            ),
            16.vertSpacing,
            ProfileSurfaceCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.enquiryFlowContractAcceptance,
                    style: 16.w700.copyWith(color: colorScheme.onSurface),
                  ),
                  12.vertSpacing,
                  Text(
                    l10n.enquiryFlowContractAcceptanceBody,
                    style: 14.w400.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      height: 1.5,
                    ),
                  ),
                  14.vertSpacing,
                  ProfileBulletRow(
                    text: l10n.enquiryFlowContractAcceptanceLine1,
                    leading: Text(
                      '•',
                      style: 16.w700.copyWith(color: colorScheme.onSurface),
                    ),
                    color: colorScheme.onSurface,
                  ),
                  10.vertSpacing,
                  ProfileBulletRow(
                    text: l10n.enquiryFlowContractAcceptanceLine2,
                    leading: Text(
                      '•',
                      style: 16.w700.copyWith(color: colorScheme.onSurface),
                    ),
                    color: colorScheme.onSurface,
                  ),
                  10.vertSpacing,
                  ProfileBulletRow(
                    text: l10n.enquiryFlowContractAcceptanceLine3,
                    leading: Text(
                      '•',
                      style: 16.w700.copyWith(color: colorScheme.onSurface),
                    ),
                    color: colorScheme.onSurface,
                  ),
                  14.vertSpacing,
                  Text(
                    l10n.enquiryFlowContractMetaId,
                    style: 13.w500.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  6.vertSpacing,
                  Text(
                    l10n.enquiryFlowContractMetaGenerated,
                    style: 13.w500.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  6.vertSpacing,
                  Text(
                    l10n.enquiryFlowContractMetaSecured,
                    style: 13.w500.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}