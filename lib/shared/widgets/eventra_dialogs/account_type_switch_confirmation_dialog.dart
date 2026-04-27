import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/onboarding/onboarding_slides/domain/models/account_type.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/resources/resources.dart';
import 'package:eventra/shared/widgets/eventra_buttons/eventra_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AccountTypeSwitchConfirmationDialog extends StatelessWidget {
  const AccountTypeSwitchConfirmationDialog({
    required this.targetAccountType,
    super.key,
  });

  static Future<bool?> show(
    BuildContext context, {
    required AccountType targetAccountType,
  }) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (_) => AccountTypeSwitchConfirmationDialog(
        targetAccountType: targetAccountType,
      ),
    );
  }

  final AccountType targetAccountType;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;

    return Dialog(
      backgroundColor: colorScheme.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              EventraVectors.switchToVendorIconProfileSettings,
              width: 42,
              height: 42,
            ),
            18.vertSpacing,
            Text(
              l10n.homeProfileSwitchAccountDialogTitle,
              textAlign: TextAlign.center,
              style: 18.w700.copyWith(color: colorScheme.onSurface),
            ),
            12.vertSpacing,
            Text(
              targetAccountType == AccountType.vendor
                  ? l10n.homeProfileSwitchAccountDialogVendorBody
                  : l10n.homeProfileSwitchAccountDialogClientBody,
              textAlign: TextAlign.center,
              style: 14.w400.copyWith(
                color: colorScheme.onSurfaceVariant,
                height: 1.5,
              ),
            ),
            24.vertSpacing,
            EventraButton(
              buttonText: targetAccountType == AccountType.vendor
                  ? l10n.homeProfileSwitchToVendor
                  : l10n.homeProfileSwitchToClient,
              onPressed: () => Navigator.of(context).pop(true),
            ),
            12.vertSpacing,
            EventraButton.outlined(
              buttonText: l10n.commonCancel,
              onPressed: () => Navigator.of(context).pop(false),
            ),
          ],
        ),
      ),
    );
  }
}
