import 'package:eventra/features/home/presentation/widgets/home_bottom_nav_item.dart';
import 'package:eventra/features/home/presentation/widgets/home_bottom_search_action.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';

class EventraBottomNav extends StatelessWidget {
  const EventraBottomNav({
    required this.currentIndex,
    required this.onTap,
    super.key,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 24),
      decoration: BoxDecoration(
        color: colorScheme.surface,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            key: const Key('nav_tab_0'),
            child: HomeBottomNavItem(
              iconPath: EventraVectors.homeIcon,
              label: l10n.navHome,
              isActive: currentIndex == 0,
              onTap: () => onTap(0),
            ),
          ),
          SizedBox(
            key: const Key('nav_tab_1'),
            child: HomeBottomNavItem(
              iconPath: EventraVectors.stickynote,
              label: l10n.navEnquiries,
              isActive: currentIndex == 1,
              onTap: () => onTap(1),
            ),
          ),
          HomeBottomSearchAction(onTap: () => onTap(2)),
          SizedBox(
            key: const Key('nav_tab_3'),
            child: HomeBottomNavItem(
              iconPath: EventraVectors.basilVideoOutlineClient,
              label: l10n.navShowcase,
              isActive: currentIndex == 3,
              onTap: () => onTap(3),
            ),
          ),
          SizedBox(
            key: const Key('nav_tab_4'),
            child: HomeBottomNavItem(
              pathIsImage: true,
              iconPath: EventraImages.profileDummy,
              label: l10n.navProfile,
              isActive: currentIndex == 4,
              onTap: () => onTap(4),
            ),
          ),
        ],
      ),
    );
  }
}
