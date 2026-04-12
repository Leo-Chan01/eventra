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
          child: Container(
            height: 52,
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHighest.withValues(
                alpha: 0.35,
              ),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: colorScheme.surfaceContainerHighest.withValues(
                  alpha: 0.3,
                ),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    key: const Key('home_search_field'),
                    onTap: onTapSearch,
                    behavior: HitTestBehavior.opaque,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            EventraVectors.searchNormal,
                            height: 20,
                            width: 20,
                          ),
                          12.horizSpacing,
                          Text(
                            l10n.homeSearchPlaceholder,
                            style: 14.regular.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  key: const Key('home_filter_button'),
                  onTap: onTapFilter,
                  borderRadius: BorderRadius.circular(10),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: SvgPicture.asset(
                      EventraVectors.filterIcon,
                      height: 40,
                      width: 40,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        12.horizSpacing,
      ],
    );
  }
}
