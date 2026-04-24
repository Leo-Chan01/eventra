import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/auth/signup/presentation/pages/vendor_kyc_bank_details_page.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/resources/resources.dart';
import 'package:eventra/shared/widgets/eventra_buttons/eventra_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VendorKycGovIdPreviewPage extends StatelessWidget {
  const VendorKycGovIdPreviewPage({super.key});

  static const String path = '/vendor-kyc-government-id-preview';
  static const String name = 'vendor-kyc-government-id-preview';

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
            children: [
              const Spacer(flex: 2),
              Image.asset(
                EventraImages.idCardDummy,
                width: 250,
                height: 150,
                fit: BoxFit.cover,
              ),
              36.vertSpacing,
              Text(
                l10n.vendorGovIdPreviewTitle,
                style: 24.bold.copyWith(color: colorScheme.onSurface),
              ),
              const Spacer(flex: 5),
              EventraButton(
                buttonText: l10n.continueButton,
                onPressed: () => context.pushNamed(VendorKycBankDetailsPage.name),
              ),
              24.vertSpacing,
            ],
          ),
        ),
      ),
    );
  }
}
