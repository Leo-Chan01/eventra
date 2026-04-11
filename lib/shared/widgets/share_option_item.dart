import 'package:eventra/core/utils/num_extensions.dart';
import 'package:flutter/material.dart';

class ShareOptionItem extends StatelessWidget {
  const ShareOptionItem({
    required this.label,
    required this.child,
    required this.backgroundColor,
    this.onTap,
    super.key,
  });

  final String label;
  final Widget child;
  final Color backgroundColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        width: 88,
        child: Column(
          children: [
            Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                color: backgroundColor,
                shape: BoxShape.circle,
              ),
              child: Center(child: child),
            ),
            12.vertSpacing,
            Text(
              label,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: 13.w500.copyWith(color: colorScheme.onSurface),
            ),
          ],
        ),
      ),
    );
  }
}
