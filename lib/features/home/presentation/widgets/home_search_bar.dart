import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                  borderRadius: BorderRadius.circular(16),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: const Color(0xFFFAFAFA),
                    hintText: l10n.homeSearchPlaceholder,
                    hintStyle: 14.regular.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12),
                      child: SvgPicture.asset(
                        EventraVectors.searchNormal,
                        height: 20,
                        width: 20,
                      ),
                    ),
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: colorScheme.surfaceContainerHighest.withValues(
                          alpha: 0.3,
                        ),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: colorScheme.surfaceContainerHighest.withValues(
                          alpha: 0.3,
                        ),
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 14),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(8),
                      child: SizedBox(
                        height: 52,
                        width: 52,
                        child: SvgPicture.asset(EventraVectors.filterIcon),
                      ),
                    ),
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
