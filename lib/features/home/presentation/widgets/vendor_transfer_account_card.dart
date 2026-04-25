import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/l10n/gen/app_localizations.dart';
import 'package:flutter/material.dart';

class VendorTransferAccountCard extends StatelessWidget {
  const VendorTransferAccountCard({
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.l10n,
    super.key,
  });

  final String value;
  final String groupValue;
  final ValueChanged<String?> onChanged;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: colorScheme.outline.withValues(alpha: 0.1),
          width: 1.5,
        ),
      ),
      child: RadioGroup<String>(
        groupValue: groupValue,
        onChanged: onChanged,
        child: RadioListTile<String>(
          value: value,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 8,
          ),
          controlAffinity: ListTileControlAffinity.trailing,
          activeColor: colorScheme.primary,
          title: Row(
            children: [
              Container(
                width: 56,
                height: 56,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: colorScheme.primary,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  l10n.vendorTransferBankBadge,
                  style: 14.w700.copyWith(color: colorScheme.onPrimary),
                ),
              ),
              12.horizSpacing,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.vendorTransferAccountName,
                      style: 15.w500.copyWith(color: colorScheme.onSurface),
                    ),
                    2.vertSpacing,
                    Text(
                      l10n.vendorTransferAccountNumber,
                      style: 20.w500.copyWith(color: colorScheme.onSurface),
                    ),
                    Text(
                      l10n.vendorTransferBankName,
                      style: 16.w500.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
