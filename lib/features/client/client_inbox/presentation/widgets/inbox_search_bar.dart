import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class InboxSearchBar extends StatelessWidget {
  const InboxSearchBar({
    required this.onChanged,
    required this.controller,
    super.key,
  });

  final ValueChanged<String> onChanged;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            onChanged: onChanged,
            style: 14.w400.copyWith(color: colorScheme.onSurface),
            decoration: InputDecoration(
              hintText: l10n.inboxSearchHint,
              prefixIcon: HugeIcon(
                icon: HugeIcons.strokeRoundedSearch01,
                size: 20,
                color: colorScheme.onSurfaceVariant,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
            ),
          ),
        ),
        12.horizSpacing,
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(10),
          ),
          child: HugeIcon(
            icon: HugeIcons.strokeRoundedFilterHorizontal,
            size: 20,
            color: colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
