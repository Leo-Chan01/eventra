import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/shared/widgets/eventra_buttons/eventra_button.dart';
import 'package:eventra/shared/widgets/eventra_input_fields/eventra_general_textfield.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VendorKycNinPage extends StatefulWidget {
  const VendorKycNinPage({super.key});

  static const String path = '/vendor-kyc-nin';
  static const String name = 'vendor-kyc-nin';

  @override
  State<VendorKycNinPage> createState() => VendorKycNinPageState();
}

class VendorKycNinPageState extends State<VendorKycNinPage> {
  String ninValue = '64547433737';

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
                padding: EdgeInsets.zero,
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
              EventraGeneralTextfield(
                label: l10n.vendorKycNin,
                hint: l10n.vendorKycNinHint,
                initialValue: ninValue,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    ninValue = value;
                  });
                },
              ),
              const Spacer(),
              EventraButton(
                buttonText: l10n.continueButton,
                onPressed: ninValue.trim().isEmpty ? null : () {},
              ),
              24.vertSpacing,
            ],
          ),
        ),
      ),
    );
  }
}
