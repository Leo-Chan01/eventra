import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/l10n/l10n.dart';
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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.only(top: 12, bottom: 24),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        border: Border(
          top: BorderSide(
            color: colorScheme.outline.withValues(alpha: 0.1),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavTab(
            icon: Icons.home_filled,
            label: l10n.navHome,
            isActive: currentIndex == 0,
            onTap: () => onTap(0),
          ),
          _NavTab(
            icon: Icons.chat_bubble_outline_rounded,
            label: l10n.navEnquiries,
            isActive: currentIndex == 1,
            onTap: () => onTap(1),
          ),
          _NavSearchAction(
            onTap: () => onTap(2),
          ),
          _NavTab(
            icon: Icons.grid_view_rounded,
            label: l10n.navShowcase,
            isActive: currentIndex == 3,
            onTap: () => onTap(3),
          ),
          _NavTab(
            icon: Icons.person_outline_rounded,
            label: l10n.navProfile,
            isActive: currentIndex == 4,
            onTap: () => onTap(4),
          ),
        ],
      ),
    );
  }
}

class _NavTab extends StatelessWidget {
  const _NavTab({
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isActive ? colorScheme.primary : colorScheme.onSurfaceVariant,
            size: 24,
          ),
          4.vertSpacing,
          Text(
            label,
            style: 10.w500.copyWith(
              color: isActive ? colorScheme.primary : colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

class _NavSearchAction extends StatelessWidget {
  const _NavSearchAction({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.search_rounded,
          color: Colors.white,
          size: 28,
        ),
      ),
    );
  }
}
