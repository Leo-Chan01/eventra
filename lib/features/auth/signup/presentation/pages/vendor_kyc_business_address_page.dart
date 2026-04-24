import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/auth/signup/presentation/pages/vendor_kyc_bank_details_page.dart';
import 'package:eventra/features/auth/signup/presentation/widgets/vendor_kyc_upload_field.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/shared/widgets/eventra_buttons/eventra_button.dart';
import 'package:eventra/shared/widgets/eventra_input_fields/eventra_general_textfield.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VendorKycBusinessAddressPage extends StatefulWidget {
  const VendorKycBusinessAddressPage({super.key});

  static const String path = '/vendor-kyc-business-address';
  static const String name = 'vendor-kyc-business-address';

  @override
  State<VendorKycBusinessAddressPage> createState() =>
      VendorKycBusinessAddressPageState();
}

class VendorKycBusinessAddressPageState
    extends State<VendorKycBusinessAddressPage> {
  String businessAddress = '';
  String landmark = '';
  String city = '';

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;
    final canContinue =
        businessAddress.trim().isNotEmpty &&
        landmark.trim().isNotEmpty &&
        city.trim().isNotEmpty;

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
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
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
                                l10n.vendorKycBusinessAddressTitle,
                                style: 24.bold.copyWith(
                                  color: colorScheme.onSurface,
                                  height: 1.2,
                                ),
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
                        EventraGeneralTextfield(
                          label: l10n.vendorKycBusinessAddressLabel,
                          hint: l10n.vendorKycBusinessAddressHint,
                          initialValue: businessAddress,
                          keyboardType: TextInputType.streetAddress,
                          onChanged: (value) {
                            setState(() {
                              businessAddress = value;
                            });
                          },
                        ),
                        20.vertSpacing,
                        EventraGeneralTextfield(
                          label: l10n.vendorKycLandmarkLabel,
                          hint: l10n.vendorKycLandmarkHint,
                          initialValue: landmark,
                          keyboardType: TextInputType.text,
                          onChanged: (value) {
                            setState(() {
                              landmark = value;
                            });
                          },
                        ),
                        20.vertSpacing,
                        Row(
                          children: [
                            Expanded(
                              child: EventraGeneralTextfield(
                                label: l10n.vendorKycStateLabel,
                                hint: '',
                                initialValue: l10n.vendorKycStateDefault,
                                keyboardType: TextInputType.text,
                                readOnly: true,
                                suffixIcon: const Icon(
                                  Icons.keyboard_arrow_down,
                                ),
                              ),
                            ),
                            16.horizSpacing,
                            Expanded(
                              child: EventraGeneralTextfield(
                                label: l10n.vendorKycCityLabel,
                                hint: l10n.vendorKycCityHint,
                                initialValue: city,
                                keyboardType: TextInputType.text,
                                onChanged: (value) {
                                  setState(() {
                                    city = value;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        20.vertSpacing,
                        EventraGeneralTextfield(
                          label: l10n.vendorKycProofTypeLabel,
                          hint: '',
                          initialValue: l10n.vendorKycProofTypeDefault,
                          keyboardType: TextInputType.text,
                          readOnly: true,
                          suffixIcon: const Icon(Icons.keyboard_arrow_down),
                        ),
                        20.vertSpacing,
                        VendorKycUploadField(
                          label: l10n.vendorKycUploadUtilityBillLabel,
                          hint: '',
                        ),
                        const Spacer(),
                        EventraButton(
                          buttonText: l10n.continueButton,
                          onPressed: canContinue
                              ? () =>
                                  context.pushNamed(VendorKycBankDetailsPage.name)
                              : null,
                        ),
                        24.vertSpacing,
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
