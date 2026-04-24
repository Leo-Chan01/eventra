import 'package:camera/camera.dart';
import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/auth/signup/presentation/widgets/selfie_preview.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/shared/widgets/eventra_buttons/eventra_button.dart';
import 'package:flutter/material.dart';

class SelfieConfirmationDialog extends StatelessWidget {
  const SelfieConfirmationDialog({
    required this.photo,
    super.key,
  });

  final XFile? photo;

  static Future<bool?> show(BuildContext context, XFile? photo) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (_) => SelfieConfirmationDialog(photo: photo),
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
        padding: const EdgeInsets.fromLTRB(24, 20, 24, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              l10n.selfieQualityTitle,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: colorScheme.onSurface,
                height: 1.3,
              ),
            ),
            24.vertSpacing,
            Center(child: SelfiePreview(photo: photo)),
            24.vertSpacing,
            EventraButton(
              buttonText: l10n.selfieUseThis,
              onPressed: () => Navigator.of(context).pop(true),
            ),
            12.vertSpacing,
            EventraButton.outlined(
              buttonText: l10n.selfieRetake,
              onPressed: () => Navigator.of(context).pop(false),
            ),
          ],
        ),
      ),
    );
  }
}
