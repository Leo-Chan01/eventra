import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hugeicons/hugeicons.dart';

class DeleteAccountPasswordDialog extends StatefulWidget {
  const DeleteAccountPasswordDialog({
    required this.onDeleteConfirmed,
    super.key,
  });

  final ValueChanged<String> onDeleteConfirmed;

  static Future<void> show(
    BuildContext context, {
    required ValueChanged<String> onDeleteConfirmed,
  }) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (_) => DeleteAccountPasswordDialog(
        onDeleteConfirmed: onDeleteConfirmed,
      ),
    );
  }

  @override
  State<DeleteAccountPasswordDialog> createState() =>
      _DeleteAccountPasswordDialogState();
}

class _DeleteAccountPasswordDialogState
    extends State<DeleteAccountPasswordDialog> {
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;
    final inputDecoration = Theme.of(context).inputDecorationTheme;

    return Dialog(
      backgroundColor: colorScheme.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 28, 24, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: colorScheme.error.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: SvgPicture.asset(
                  EventraVectors.cautionSignOrange,
                  width: 32,
                  height: 32,
                ),
              ),
            ),
            20.vertSpacing,
            Text(
              l10n.deleteAccountPasswordDialogTitle,
              style: 18.bold.copyWith(color: colorScheme.onSurface),
              textAlign: TextAlign.center,
            ),
            20.vertSpacing,
            TextField(
              controller: _passwordController,
              obscureText: _obscurePassword,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                hintText: l10n.deleteAccountPasswordDialogHint,
                hintStyle: inputDecoration.hintStyle,
                suffixIcon: IconButton(
                  onPressed: () =>
                      setState(() => _obscurePassword = !_obscurePassword),
                  icon: HugeIcon(
                    icon: _obscurePassword
                        ? HugeIcons.strokeRoundedView
                        : HugeIcons.strokeRoundedViewOff,
                    color: colorScheme.onSurfaceVariant,
                    size: 20,
                  ),
                ),
              ),
            ),
            24.vertSpacing,
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colorScheme.surfaceContainerHighest,
                        foregroundColor: colorScheme.onSurface,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        l10n.deleteAccountPasswordDialogCancel,
                        style: 14.w500.copyWith(color: colorScheme.onSurface),
                      ),
                    ),
                  ),
                ),
                12.horizSpacing,
                Expanded(
                  child: SizedBox(
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () =>
                          widget.onDeleteConfirmed(_passwordController.text),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colorScheme.error,
                        foregroundColor: colorScheme.onError,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        l10n.deleteAccountPasswordDialogDelete,
                        style: 14.w500.copyWith(color: colorScheme.onError),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
