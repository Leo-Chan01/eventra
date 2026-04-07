import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/resources/resources.dart';
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
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          EventraButton.withIcon(
            buttonText: l10n.vendorDetailMessageVendor,
            onPressed: onMessageVendor,
            icon: EventraVectors.messages,
          ),
          // const SizedBox(height: 10),
          // EventraButton(
          //   buttonText: l10n.vendorDetailMakeEnquiry,
          //   onPressed: onMakeEnquiry,
          // ),
        ],
      ),
    );
  }
}
