import 'package:eventra/core/utils/num_extensions.dart';
import 'package:flutter/material.dart';

class VendorCategoryOptionChip extends StatelessWidget {
  const VendorCategoryOptionChip({
    required this.label,
    required this.imagePath,
    required this.isSelected,
    required this.onTap,
    super.key,
  });

  final String label;
  final String imagePath;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(999),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          decoration: BoxDecoration(
            color: isSelected
                ? colorScheme.primary.withValues(alpha: 0.05)
                : colorScheme.surface,
            borderRadius: BorderRadius.circular(999),
            border: Border.all(
              color: isSelected
                  ? colorScheme.primary
                  : colorScheme.outline.withValues(alpha: 0.35),
              width: isSelected ? 1.5 : 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                imagePath,
                width: 28,
                height: 28,
                fit: BoxFit.contain,
              ),
              10.horizSpacing,
              Text(
                label,
                style: 16.w500.copyWith(color: colorScheme.onSurface),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
