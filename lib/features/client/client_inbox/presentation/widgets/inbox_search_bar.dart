import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
          child: SizedBox(
            height: 52,
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              style: 14.w400.copyWith(color: colorScheme.onSurface),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: colorScheme.surfaceContainerHighest.withValues(
                      alpha: 0.3,
                    ),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: colorScheme.surfaceContainerHighest.withValues(
                      alpha: 0.3,
                    ),
                  ),
                ),
                fillColor: colorScheme.surfaceContainerHighest.withValues(
                  alpha: 0.35,
                ),
                hintText: l10n.inboxSearchHint,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12),
                  child: SvgPicture.asset(
                    EventraVectors.searchNormal,
                    height: 20,
                    width: 20,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(8),
                  child: SvgPicture.asset(
                    EventraVectors.filterIcon,
                    height: 20,
                    width: 20,
                  ),
                ),
              ),
            ),
          ),
        ),
        12.horizSpacing,
      ],
    );
  }
}
