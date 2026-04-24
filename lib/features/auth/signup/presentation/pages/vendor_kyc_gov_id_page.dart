import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/auth/signup/presentation/pages/vendor_kyc_gov_id_scan_page.dart';
import 'package:eventra/features/auth/signup/presentation/widgets/vendor_gov_id_type_tile.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/shared/widgets/eventra_buttons/eventra_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VendorKycGovIdPage extends StatefulWidget {
  const VendorKycGovIdPage({super.key});

  static const String path = '/vendor-kyc-government-id';
  static const String name = 'vendor-kyc-government-id';

  @override
  State<VendorKycGovIdPage> createState() => VendorKycGovIdPageState();
}

class VendorKycGovIdPageState extends State<VendorKycGovIdPage> {
  String? selectedType;

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
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.vendorGovIdTitle,
                      style: 24.bold.copyWith(color: colorScheme.onSurface),
                    ),
                    8.vertSpacing,
                    Text(
                      l10n.vendorGovIdSubtitle,
                      style: 14.regular.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        height: 1.45,
                      ),
                    ),
                  ],
                ),
              ),
              20.vertSpacing,
              VendorGovIdTypeTile(
                title: l10n.vendorGovIdTypeNinTitle,
                subtitle: l10n.vendorGovIdTypeNinSubtitle,
                isSelected: selectedType == 'nin',
                onTap: () => setState(() => selectedType = 'nin'),
              ),
              12.vertSpacing,
              VendorGovIdTypeTile(
                title: l10n.vendorGovIdTypeDriversLicenseTitle,
                subtitle: l10n.vendorGovIdTypeDriversLicenseSubtitle,
                isSelected: selectedType == 'drivers_license',
                onTap: () => setState(() => selectedType = 'drivers_license'),
              ),
              12.vertSpacing,
              VendorGovIdTypeTile(
                title: l10n.vendorGovIdTypePassportTitle,
                subtitle: l10n.vendorGovIdTypePassportSubtitle,
                isSelected: selectedType == 'passport',
                onTap: () => setState(() => selectedType = 'passport'),
              ),
              12.vertSpacing,
              VendorGovIdTypeTile(
                title: l10n.vendorGovIdTypeVotersIdTitle,
                subtitle: l10n.vendorGovIdTypeVotersIdSubtitle,
                isSelected: selectedType == 'voters_id',
                onTap: () => setState(() => selectedType = 'voters_id'),
              ),
              const Spacer(),
              EventraButton(
                buttonText: l10n.continueButton,
                onPressed: selectedType == null
                    ? null
                    : () => context.pushNamed(VendorKycGovIdScanPage.name),
              ),
              24.vertSpacing,
            ],
          ),
        ),
      ),
    );
  }
}
