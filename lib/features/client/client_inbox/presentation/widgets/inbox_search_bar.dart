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
          child: TextField(
            controller: controller,
            onChanged: onChanged,
            style: 14.w400.copyWith(color: colorScheme.onSurface),
            decoration: InputDecoration(
              hintText: l10n.inboxSearchHint,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(8),
                child: SvgPicture.asset(
                  EventraVectors.searchNormal,
                  colorFilter: ColorFilter.mode(
                    colorScheme.onSurfaceVariant,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset(EventraVectors.filterIcon),
              ),
            ),
          ),
        ),
        12.horizSpacing,
      ],
    );
  }
}
