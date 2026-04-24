import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/auth/signup/presentation/pages/vendor_kyc_transaction_pin_page.dart';
import 'package:eventra/features/auth/signup/presentation/widgets/vendor_kyc_account_name_badge.dart';
import 'package:eventra/features/auth/signup/presentation/widgets/vendor_kyc_select_bank_sheet.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/shared/widgets/eventra_buttons/eventra_button.dart';
import 'package:eventra/shared/widgets/eventra_input_fields/eventra_general_textfield.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VendorKycBankDetailsPage extends StatefulWidget {
  const VendorKycBankDetailsPage({super.key});

  static const String path = '/vendor-kyc-bank-details';
  static const String name = 'vendor-kyc-bank-details';

  @override
  State<VendorKycBankDetailsPage> createState() =>
      VendorKycBankDetailsPageState();
}

class VendorKycBankDetailsPageState extends State<VendorKycBankDetailsPage> {
  String accountNumber = '';
  String? selectedBank;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;
    final hasResolvedName =
        accountNumber.trim().length == 10 &&
        selectedBank != null &&
        selectedBank!.isNotEmpty;

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
              Text(
                l10n.vendorKycBankDetailsTitle,
                style: 24.bold.copyWith(color: colorScheme.onSurface),
              ),
              8.vertSpacing,
              Text(
                l10n.vendorKycBankDetailsSubtitle,
                style: 14.regular.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  height: 1.45,
                ),
              ),
              24.vertSpacing,
              EventraGeneralTextfield(
                label: l10n.vendorKycBankAccountNumberLabel,
                hint: l10n.vendorKycBankAccountNumberHint,
                initialValue: accountNumber,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    accountNumber = value;
                  });
                },
              ),
              20.vertSpacing,
              EventraGeneralTextfield(
                label: l10n.vendorKycBankLabel,
                hint: l10n.vendorKycBankSelectPlaceholder,
                initialValue: selectedBank ?? '',
                keyboardType: TextInputType.text,
                readOnly: true,
                onTap: () => _selectBank(context),
                suffixIcon: const Icon(Icons.keyboard_arrow_down),
              ),
              if (hasResolvedName) ...[
                20.vertSpacing,
                VendorKycAccountNameBadge(
                  accountName: l10n.vendorKycVerifiedAccountName,
                ),
              ],
              const Spacer(),
              EventraButton(
                buttonText: l10n.continueButton,
                onPressed: hasResolvedName
                    ? () => context.pushNamed(VendorKycTransactionPinPage.name)
                    : null,
              ),
              24.vertSpacing,
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectBank(BuildContext context) async {
    final selected = await VendorKycSelectBankSheet.show(
      context,
      selectedBank: selectedBank,
    );

    if (!mounted || selected == null) {
      return;
    }

    setState(() {
      selectedBank = selected;
    });
  }
}
