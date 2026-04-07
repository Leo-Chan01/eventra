import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/shared/widgets/eventra_buttons/eventra_button.dart';
import 'package:flutter/material.dart';

class CatalogItemActionBar extends StatelessWidget {
  const CatalogItemActionBar({
    required this.onMessageVendor,
    required this.onMakeEnquiry,
    super.key,
  });

  final VoidCallback onMessageVendor;
  final VoidCallback onMakeEnquiry;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 28),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withValues(alpha: 0.06),
            blurRadius: 16,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          EventraButton.outlined(
            buttonText: l10n.vendorDetailMessageVendor,
            onPressed: onMessageVendor,
          ),
          const SizedBox(height: 10),
          EventraButton(
            buttonText: l10n.vendorDetailMakeEnquiry,
            onPressed: onMakeEnquiry,
          ),
        ],
      ),
    );
  }
}
