import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/auth/signup/presentation/pages/vendor_kyc_bank_details_page.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/shared/widgets/eventra_buttons/eventra_button.dart';
import 'package:eventra/shared/widgets/eventra_input_fields/eventra_general_textfield.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VendorKycCacPage extends StatefulWidget {
  const VendorKycCacPage({super.key});

  static const String path = '/vendor-kyc-cac-certificate';
  static const String name = 'vendor-kyc-cac-certificate';

  @override
  State<VendorKycCacPage> createState() => VendorKycCacPageState();
}

class VendorKycCacPageState extends State<VendorKycCacPage> {
  String businessNumber = '';

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
                      l10n.vendorKycCacTitle,
                      style: 24.bold.copyWith(color: colorScheme.onSurface),
                    ),
                    8.vertSpacing,
                    Text(
                      l10n.vendorKycCacSubtitle,
                      style: 14.regular.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        height: 1.45,
                      ),
                    ),
                  ],
                ),
              ),
              24.vertSpacing,
              EventraGeneralTextfield(
                label: l10n.vendorKycCacBusinessNumberLabel,
                hint: l10n.vendorKycCacBusinessNumberHint,
                initialValue: businessNumber,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    businessNumber = value;
                  });
                },
              ),
              const Spacer(),
              EventraButton(
                buttonText: l10n.continueButton,
                onPressed: businessNumber.trim().isEmpty
                    ? null
                    : () => context.pushNamed(VendorKycBankDetailsPage.name),
              ),
              24.vertSpacing,
            ],
          ),
        ),
      ),
    );
  }
}
