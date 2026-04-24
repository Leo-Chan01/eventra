import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/auth/signup/presentation/widgets/selfie_captured_icon.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/shared/widgets/eventra_buttons/eventra_button.dart';
import 'package:flutter/material.dart';

class SelfieSuccessDialog extends StatelessWidget {
  const SelfieSuccessDialog({super.key});

  static Future<void> show(BuildContext context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (_) => const SelfieSuccessDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;

    return Dialog(
      backgroundColor: colorScheme.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 28, 24, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SelfieCapturedIcon(),
            20.vertSpacing,
            Text(
              l10n.selfieCapturedTitle,
              style: 18.bold.copyWith(
                color: colorScheme.onSurface,
                height: 1.3,
              ),
              textAlign: TextAlign.center,
            ),
            12.vertSpacing,
            Text(
              l10n.selfieCapturedSubtitle,
              style: 14.regular.copyWith(
                color: colorScheme.onSurfaceVariant,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
            24.vertSpacing,
            EventraButton(
              buttonText: l10n.continueButton,
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
    );
  }
}
