import 'package:flutter/material.dart';

class VendorDetailAddTile extends StatelessWidget {
  const VendorDetailAddTile({
    this.height,
    this.isFilled = false,
    this.onTap,
    super.key,
  });

  final bool isFilled;
  final double? height;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: isFilled
              ? colorScheme.surfaceContainerHighest.withAlpha(153)
              : null,
          border: isFilled
              ? null
              : Border.all(
                  color: colorScheme.surfaceContainerHighest.withAlpha(153),
                ),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Center(
          child: Icon(
            Icons.add_rounded,
            size: 52,
            color: colorScheme.onSurfaceVariant,
          ),
        ),
      ),
    );
  }
}
