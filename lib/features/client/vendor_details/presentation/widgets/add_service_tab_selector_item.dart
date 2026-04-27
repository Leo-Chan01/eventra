import 'package:eventra/core/utils/num_extensions.dart';
import 'package:flutter/material.dart';

class AddServiceTabSelectorItem extends StatelessWidget {
  const AddServiceTabSelectorItem({
    required this.label,
    required this.isSelected,
    required this.onTap,
    super.key,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              label,
              style: 16.w500.copyWith(
                color: isSelected ? colorScheme.primary : colorScheme.onSurface,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            height: 2,
            color: isSelected ? colorScheme.primary : Colors.transparent,
          ),
        ],
      ),
    );
  }
}
