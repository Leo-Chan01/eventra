import 'package:eventra/core/utils/num_extensions.dart';
import 'package:flutter/material.dart';

class ProfileContractDetailRow extends StatelessWidget {
  const ProfileContractDetailRow({
    required this.label,
    required this.value,
    this.showDivider = true,
    super.key,
  });

  final String label;
  final String value;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                label,
                style: 14.w500.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ),
            16.horizSpacing,
            Expanded(
              child: Text(
                value,
                textAlign: TextAlign.right,
                style: 14.w600.copyWith(color: colorScheme.onSurface),
              ),
            ),
          ],
        ),
        if (showDivider) ...[
          14.vertSpacing,
          Divider(
            height: 1,
            color: colorScheme.outlineVariant.withValues(alpha: 0.7),
          ),
          14.vertSpacing,
        ],
      ],
    );
  }
}
