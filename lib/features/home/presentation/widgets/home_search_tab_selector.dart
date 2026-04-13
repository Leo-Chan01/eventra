import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:flutter/material.dart';

class HomeSearchTabSelector extends StatelessWidget {
  const HomeSearchTabSelector({
    required this.selectedTab,
    required this.onSelectTab,
    super.key,
  });

  final int selectedTab;
  final ValueChanged<int> onSelectTab;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              key: const Key('home_search_tab_vendors'),
              onTap: () => onSelectTab(0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    child: Text(
                      l10n.homeSearchVendorsTab,
                      style: 16.w600.copyWith(
                        color: selectedTab == 0
                            ? colorScheme.onSurface
                            : colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                  Container(
                    height: 2,
                    color: selectedTab == 0
                        ? colorScheme.primary
                        : colorScheme.surface.withValues(alpha: 0),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              key: const Key('home_search_tab_events'),
              onTap: () => onSelectTab(1),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    child: Text(
                      l10n.homeSearchEventsTab,
                      style: 16.w600.copyWith(
                        color: selectedTab == 1
                            ? colorScheme.onSurface
                            : colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                  Container(
                    height: 2,
                    color: selectedTab == 1
                        ? colorScheme.primary
                        : colorScheme.surface.withValues(alpha: 0),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
