import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class InvoiceAttachmentCard extends StatelessWidget {
  const InvoiceAttachmentCard({required this.onTap, super.key});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.72,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.35),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: colorScheme.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: HugeIcon(
                icon: HugeIcons.strokeRoundedInvoice01,
                size: 20,
                color: colorScheme.primary,
              ),
            ),
            10.horizSpacing,
            Expanded(
              child: Text(
                l10n.chatInvoice,
                style: 13.w600.copyWith(color: colorScheme.onSurface),
              ),
            ),
            GestureDetector(
              onTap: onTap,
              child: Text(
                l10n.chatInvoiceView,
                style: 12.w700.copyWith(color: colorScheme.primary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
