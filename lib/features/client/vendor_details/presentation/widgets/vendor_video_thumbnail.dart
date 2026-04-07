import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class VendorVideoThumbnail extends StatelessWidget {
  const VendorVideoThumbnail({
    required this.imageUrl,
    required this.onTap,
    super.key,
  });

  final String imageUrl;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (_, _, _) => ColoredBox(
                color: colorScheme.primaryContainer,
                child: Icon(
                  Icons.image_not_supported_outlined,
                  color: colorScheme.primary,
                ),
              ),
            ),
            Center(
              child: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: colorScheme.surface.withValues(alpha: 0.75),
                  shape: BoxShape.circle,
                ),
                child: HugeIcon(
                  icon: HugeIcons.strokeRoundedPlay,
                  color: colorScheme.onSurface,
                  size: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
