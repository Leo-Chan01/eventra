import 'package:eventra/core/utils/num_extensions.dart';
import 'package:flutter/material.dart';

class HomeCategoryChip extends StatelessWidget {
  const HomeCategoryChip({
    required this.label,
    this.icon = '',
    this.isSelected = false,
    this.onTap,
    super.key,
  });

  final String label;
  final String icon;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(999),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? colorScheme.primary : null,
          borderRadius: BorderRadius.circular(999),
          border: Border.all(
            color: isSelected
                ? colorScheme.primary
                : colorScheme.onSurfaceVariant.withValues(alpha: 0.2),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon.isNotEmpty) ...[
              Image.asset(icon),
              6.horizSpacing,
            ],
            Text(
              label,
              style: 12.w600.copyWith(
                color: isSelected
                    ? colorScheme.onPrimary
                    : colorScheme.onSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
