import 'package:eventra/core/utils/num_extensions.dart';
import 'package:flutter/material.dart';

class VendorKycAccountNameBadge extends StatelessWidget {
  const VendorKycAccountNameBadge({
    required this.accountName,
    super.key,
  });

  final String accountName;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: colorScheme.primary.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            width: 22,
            height: 22,
            decoration: BoxDecoration(
              color: colorScheme.primary,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Icon(Icons.check, size: 14, color: colorScheme.onPrimary),
          ),
          14.horizSpacing,
          Expanded(
            child: Text(
              accountName,
              style: 16.w400.copyWith(color: colorScheme.primary),
            ),
          ),
        ],
      ),
    );
  }
}
