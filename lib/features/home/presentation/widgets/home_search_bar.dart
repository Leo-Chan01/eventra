import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:flutter/material.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({
    required this.onTapFilter,
    required this.onTapSearch,
    super.key,
  });

  final VoidCallback onTapFilter;
  final VoidCallback onTapSearch;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: onTapSearch,
            borderRadius: BorderRadius.circular(16),
            child: IgnorePointer(
              child: Container(
                height: 52,
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerHighest.withValues(
                    alpha: 0.3,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: l10n.homeSearchPlaceholder,
                    hintStyle: 14.regular.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                    prefixIcon: Icon(
                      Icons.search_rounded,
                      color: colorScheme.onSurfaceVariant,
                    ),
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ),
            ),
          ),
        ),
        12.horizSpacing,
        Container(
          height: 52,
          width: 52,
          decoration: BoxDecoration(
            color: colorScheme.primary.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(16),
          ),
          child: IconButton(
            key: const Key('home_filter_button'),
            onPressed: onTapFilter,
            icon: Icon(
              Icons.tune_rounded,
              color: colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }
}
