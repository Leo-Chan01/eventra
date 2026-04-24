import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/auth/signup/presentation/widgets/selfie_captured_icon.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/shared/widgets/eventra_buttons/eventra_button.dart';
import 'package:flutter/material.dart';

class VendorKycVerificationSubmittedSheet extends StatelessWidget {
  const VendorKycVerificationSubmittedSheet({super.key});

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      isDismissible: false,
      enableDrag: false,
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => const VendorKycVerificationSubmittedSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;

    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 42,
              height: 4,
              decoration: BoxDecoration(
                color: colorScheme.outline.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            24.vertSpacing,
            const SelfieCapturedIcon(),
            24.vertSpacing,
            Text(
              l10n.vendorKycVerificationSubmittedTitle,
              style: 32.w400.copyWith(color: colorScheme.onSurface),
              textAlign: TextAlign.center,
            ),
            8.vertSpacing,
            Text(
              l10n.vendorKycVerificationSubmittedSubtitle,
              style: 14.regular.copyWith(color: colorScheme.onSurfaceVariant),
              textAlign: TextAlign.center,
            ),
            28.vertSpacing,
            EventraButton(
              buttonText: l10n.continueButton,
              onPressed: () => Navigator.of(context).pop(),
            ),
            8.vertSpacing,
          ],
        ),
      ),
    );
  }
}
