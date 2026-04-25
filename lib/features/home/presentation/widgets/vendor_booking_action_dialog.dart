import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/shared/widgets/eventra_buttons/eventra_button.dart';
import 'package:eventra/shared/widgets/eventra_dotted_border.dart';
import 'package:flutter/material.dart';

/// Generic action-result dialog used by confirm / job-completed / reject flows.
class VendorBookingActionDialog extends StatelessWidget {
  const VendorBookingActionDialog({
    required this.iconData,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.buttonLabel,
    this.onButtonPressed,
    super.key,
  });

  final IconData iconData;
  final Color iconColor;
  final String title;
  final String subtitle;
  final String buttonLabel;
  final VoidCallback? onButtonPressed;

  static Future<void> show(
    BuildContext context, {
    required IconData iconData,
    required Color iconColor,
    required String title,
    required String subtitle,
    required String buttonLabel,
    VoidCallback? onButtonPressed,
  }) async {
    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (_) => VendorBookingActionDialog(
        iconData: iconData,
        iconColor: iconColor,
        title: title,
        subtitle: subtitle,
        buttonLabel: buttonLabel,
        onButtonPressed: onButtonPressed,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Dialog(
      backgroundColor: colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      insetPadding: const EdgeInsets.symmetric(horizontal: 28),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 36, 24, 28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            EventraDottedBorder(
              type: EventraDottedBorderType.circle,
              color: iconColor,
              strokeWidth: 2.5,
              dashLength: 10,
              gapLength: 6,
              padding: const EdgeInsets.all(12),
              child: Container(
                width: 68,
                height: 68,
                decoration: BoxDecoration(
                  color: iconColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  iconData,
                  color: Colors.white,
                  size: 32,
                ),
              ),
            ),
            28.vertSpacing,
            Text(
              title,
              textAlign: TextAlign.center,
              style: 22.w700.copyWith(color: colorScheme.onSurface),
            ),
            16.vertSpacing,
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: 16.w400.copyWith(color: colorScheme.onSurfaceVariant),
            ),
            28.vertSpacing,
            EventraButton(
              buttonText: buttonLabel,
              width: double.infinity,
              onPressed: () {
                Navigator.of(context).pop();
                onButtonPressed?.call();
              },
            ),
          ],
        ),
      ),
    );
  }
}
