import 'package:eventra/core/utils/num_extensions.dart';
import 'package:flutter/material.dart';

class VendorDetailTabBar extends StatelessWidget {
  const VendorDetailTabBar({
    required this.tabs,
    required this.selectedIndex,
    required this.onTabSelected,
    super.key,
  });

  final List<String> tabs;
  final int selectedIndex;
  final ValueChanged<int> onTabSelected;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: List.generate(tabs.length, (index) {
        final isSelected = selectedIndex == index;
        return Expanded(
          child: GestureDetector(
            onTap: () => onTabSelected(index),
            behavior: HitTestBehavior.opaque,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    tabs[index],
                    style: 13.w600.copyWith(
                      color: isSelected
                          ? colorScheme.onSurface
                          : colorScheme.onSurfaceVariant,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  height: 2,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? colorScheme.onSurface
                        : colorScheme.outlineVariant,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
