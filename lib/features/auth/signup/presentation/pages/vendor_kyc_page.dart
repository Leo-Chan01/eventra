import 'dart:async';

import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/auth/signup/presentation/pages/vendor_kyc_business_address_page.dart';
import 'package:eventra/features/auth/signup/presentation/pages/vendor_kyc_cac_page.dart';
import 'package:eventra/features/auth/signup/presentation/pages/vendor_kyc_facial_verification_page.dart';
import 'package:eventra/features/auth/signup/presentation/pages/vendor_kyc_gov_id_page.dart';
import 'package:eventra/features/auth/signup/presentation/pages/vendor_kyc_nin_page.dart';
import 'package:eventra/features/auth/signup/presentation/widgets/vendor_kyc_requirement_tile.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/resources/resources.dart';
import 'package:eventra/shared/widgets/eventra_buttons/eventra_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VendorKycPage extends StatefulWidget {
  const VendorKycPage({super.key});

  static const String path = '/vendor-kyc';
  static const String name = 'vendor-kyc';

  @override
  State<VendorKycPage> createState() => VendorKycPageState();
}

class VendorKycPageState extends State<VendorKycPage> {
  String? selectedTile;
  String? loadingTile;

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
                        isLoading: loadingTile == l10n.vendorKycNin,
                        isSelected: selectedTile == l10n.vendorKycNin,
                        onTap: () => _selectTile(l10n.vendorKycNin),
                      ),
                      12.vertSpacing,
                      VendorKycRequirementTile(
                        title: l10n.vendorKycFacialVerification,
                        leadingIcon: EventraVectors.facialVerification,
                        isLoading:
                            loadingTile == l10n.vendorKycFacialVerification,
                        isSelected:
                            selectedTile == l10n.vendorKycFacialVerification,
                        onTap: () =>
                            _selectTile(l10n.vendorKycFacialVerification),
                      ),
                      12.vertSpacing,
                      VendorKycRequirementTile(
                        title: l10n.vendorKycCacCertificate,
                        leadingIcon: EventraVectors.cacCertificateIcon,
                        isLoading: loadingTile == l10n.vendorKycCacCertificate,
                        isSelected:
                            selectedTile == l10n.vendorKycCacCertificate,
                        onTap: () => _selectTile(l10n.vendorKycCacCertificate),
                      ),
                      12.vertSpacing,
                      VendorKycRequirementTile(
                        title: l10n.vendorKycBusinessAddressProof,
                        leadingIcon: EventraVectors.addressIcon,
                        isLoading:
                            loadingTile == l10n.vendorKycBusinessAddressProof,
                        isSelected:
                            selectedTile == l10n.vendorKycBusinessAddressProof,
                        onTap: () =>
                            _selectTile(l10n.vendorKycBusinessAddressProof),
                      ),
                      12.vertSpacing,
                      VendorKycRequirementTile(
                        title: l10n.vendorKycGovernmentId,
                        leadingIcon: EventraVectors.ninGovIssuedCertIcon,
                        isLoading: loadingTile == l10n.vendorKycGovernmentId,
                        isSelected: selectedTile == l10n.vendorKycGovernmentId,
                        onTap: () => _selectTile(l10n.vendorKycGovernmentId),
                      ),
                      16.vertSpacing,
                    ],
                  ),
                ),
              ),
              EventraButton(
                buttonText: l10n.continueButton,
                onPressed: selectedTile == null || loadingTile != null
                    ? null
                    : () => unawaited(_onContinue(context)),
              ),
              24.vertSpacing,
            ],
          ),
        ),
      ),
    );
  }

  Future<void> simulateKycLoad({
    required String tile,
    VoidCallback? onCompleted,
  }) async {
    if (loadingTile != null) {
      return;
    }

    setState(() {
      loadingTile = tile;
    });

    await Future<void>.delayed(const Duration(milliseconds: 1400));

    if (!mounted) {
      return;
    }

    setState(() {
      loadingTile = null;
    });

    onCompleted?.call();
  }

  void _selectTile(String tile) {
    if (loadingTile != null) {
      return;
    }

    setState(() {
      selectedTile = tile;
    });
  }

  Future<void> _onContinue(BuildContext context) async {
    final l10n = context.l10n;
    final tile = selectedTile;
    if (tile == null) {
      return;
    }

    if (tile == l10n.vendorKycNin) {
      await simulateKycLoad(
        tile: tile,
        onCompleted: () {
          unawaited(context.pushNamed(VendorKycNinPage.name));
        },
      );
      return;
    }

    if (tile == l10n.vendorKycFacialVerification) {
      await simulateKycLoad(
        tile: tile,
        onCompleted: () {
          unawaited(context.pushNamed(VendorKycFacialVerificationPage.name));
        },
      );
      return;
    }

    if (tile == l10n.vendorKycCacCertificate) {
      await simulateKycLoad(
        tile: tile,
        onCompleted: () {
          unawaited(context.pushNamed(VendorKycCacPage.name));
        },
      );
      return;
    }

    if (tile == l10n.vendorKycBusinessAddressProof) {
      await simulateKycLoad(
        tile: tile,
        onCompleted: () {
          unawaited(context.pushNamed(VendorKycBusinessAddressPage.name));
        },
      );
      return;
    }

    await simulateKycLoad(
      tile: tile,
      onCompleted: () {
        unawaited(context.pushNamed(VendorKycGovIdPage.name));
      },
    );
  }
}
