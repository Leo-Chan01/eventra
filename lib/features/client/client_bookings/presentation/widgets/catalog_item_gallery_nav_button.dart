import 'package:eventra/shared/widgets/eventra_buttons/eventra_nav_button.dart';
import 'package:flutter/material.dart';

class CatalogItemGalleryNavButton extends StatelessWidget {
  const CatalogItemGalleryNavButton({
    required this.icon,
    required this.onPressed,
    required this.isPrimary,
    super.key,
  });

  final List<List<dynamic>> icon;
  final VoidCallback? onPressed;
  final bool isPrimary;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDisabled = onPressed == null;

    return GestureDetector(
      onTap: onPressed,
      child: AnimatedOpacity(
        opacity: isDisabled ? 0.3 : 1.0,
        duration: const Duration(milliseconds: 200),
        child: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: isPrimary
                ? colorScheme.primary
                : Colors.white.withValues(alpha: 0.2),
            shape: BoxShape.circle,
          ),
          child: EventraNavButton.blurGlassVersion(isLiked: false),
        ),
      ),
    );
  }
}
