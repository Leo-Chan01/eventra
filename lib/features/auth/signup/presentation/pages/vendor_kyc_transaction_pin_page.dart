import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/auth/signup/presentation/pages/vendor_kyc_under_review_page.dart';
import 'package:eventra/features/auth/signup/presentation/widgets/vendor_kyc_pin_indicator_row.dart';
import 'package:eventra/features/auth/signup/presentation/widgets/vendor_kyc_transaction_pin_keypad.dart';
import 'package:eventra/features/auth/signup/presentation/widgets/vendor_kyc_verification_submitted_sheet.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VendorKycTransactionPinPage extends StatefulWidget {
  const VendorKycTransactionPinPage({super.key});

  static const String path = '/vendor-kyc-transaction-pin';
  static const String name = 'vendor-kyc-transaction-pin';

  @override
  State<VendorKycTransactionPinPage> createState() =>
      VendorKycTransactionPinPageState();
}

class VendorKycTransactionPinPageState
    extends State<VendorKycTransactionPinPage> {
  String pin = '';

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
              Text(
                l10n.vendorKycTransactionPinTitle,
                style: 24.bold.copyWith(color: colorScheme.onSurface),
              ),
              8.vertSpacing,
              Text(
                l10n.vendorKycTransactionPinSubtitle,
                style: 14.regular.copyWith(color: colorScheme.onSurfaceVariant),
              ),
              64.vertSpacing,
              Center(child: VendorKycPinIndicatorRow(filledCount: pin.length)),
              const Spacer(),
              VendorKycTransactionPinKeypad(
                onDigitPressed: _onDigitPressed,
                onBackspacePressed: _onBackspacePressed,
              ),
              24.vertSpacing,
            ],
          ),
        ),
      ),
    );
  }

  void _onDigitPressed(String digit) {
    if (pin.length >= 4) {
      return;
    }

    setState(() {
      pin = '$pin$digit';
    });

    if (pin.length == 4) {
      _finishPinFlow();
    }
  }

  void _onBackspacePressed() {
    if (pin.isEmpty) {
      return;
    }

    setState(() {
      pin = pin.substring(0, pin.length - 1);
    });
  }

  Future<void> _finishPinFlow() async {
    await VendorKycVerificationSubmittedSheet.show(context);
    if (!mounted) {
      return;
    }
    context.goNamed(VendorKycUnderReviewPage.name);
  }
}
