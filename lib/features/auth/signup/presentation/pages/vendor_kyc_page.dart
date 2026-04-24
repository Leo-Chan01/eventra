import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/auth/signup/presentation/widgets/vendor_kyc_requirement_tile.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/resources/resources.dart';
import 'package:eventra/shared/widgets/eventra_buttons/eventra_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VendorKycPage extends StatelessWidget {
  const VendorKycPage({super.key});

  static const String path = '/vendor-kyc';
  static const String name = 'vendor-kyc';

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.vertSpacing,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.vendorKycTitle,
                      style: 24.bold.copyWith(color: colorScheme.onSurface),
                    ),
                    8.vertSpacing,
                    Text(
                      l10n.vendorKycSubtitle,
                      style: 14.regular.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        height: 1.45,
                      ),
                    ),
                  ],
                ),
              ),
              24.vertSpacing,
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      VendorKycRequirementTile(
                        title: l10n.vendorKycNin,
                        leadingIcon: EventraVectors.ninGovIssuedCertIcon,
                      ),
                      12.vertSpacing,
                      VendorKycRequirementTile(
                        title: l10n.vendorKycFacialVerification,
                        leadingIcon: EventraVectors.facialVerification,
                      ),
                      12.vertSpacing,
                      VendorKycRequirementTile(
                        title: l10n.vendorKycCacCertificate,
                        leadingIcon: EventraVectors.cacCertificateIcon,
                      ),
                      12.vertSpacing,
                      VendorKycRequirementTile(
                        title: l10n.vendorKycBusinessAddressProof,
                        leadingIcon: EventraVectors.addressIcon,
                      ),
                      12.vertSpacing,
                      VendorKycRequirementTile(
                        title: l10n.vendorKycGovernmentId,
                        leadingIcon: EventraVectors.ninGovIssuedCertIcon,
                      ),
                      16.vertSpacing,
                    ],
                  ),
                ),
              ),
              EventraButton(
                buttonText: l10n.continueButton,
                onPressed: null,
              ),
              24.vertSpacing,
            ],
          ),
        ),
      ),
    );
  }
}
