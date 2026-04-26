import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InboxSearchBar extends StatelessWidget {
  const InboxSearchBar({
    required this.onChanged,
    required this.controller,
    this.hintText,
    this.showFilter = true,
    super.key,
  });

  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  final String? hintText;
  final bool showFilter;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      height: 56,
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: 14.w400.copyWith(color: colorScheme.onSurface),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: colorScheme.outline.withValues(alpha: 0.35),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: colorScheme.outline.withValues(alpha: 0.35),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: colorScheme.outline),
          ),
          fillColor: colorScheme.surface,
          hintText: hintText ?? l10n.inboxSearchHint,
          hintStyle: 14.w400.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(14),
            child: SvgPicture.asset(
              EventraVectors.searchNormal,
              height: 22,
              width: 22,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          suffixIcon: showFilter
              ? Padding(
                  padding: const EdgeInsets.all(10),
                  child: SvgPicture.asset(
                    EventraVectors.filterIcon,
                    height: 20,
                    width: 20,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
