import 'package:flutter/material.dart';

class CatalogItemThumbnailStrip extends StatelessWidget {
  const CatalogItemThumbnailStrip({
    required this.images,
    required this.selectedIndex,
    required this.onThumbnailTapped,
    super.key,
  });

  final List<String> images;
  final int selectedIndex;
  final ValueChanged<int> onThumbnailTapped;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      height: 80,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: images.length,
        separatorBuilder: (_, _) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final isSelected = index == selectedIndex;

          return GestureDetector(
            key: ValueKey('catalog-item-thumbnail-$index'),
            onTap: () => onThumbnailTapped(index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: isSelected
                    ? Border.all(color: colorScheme.primary, width: 2)
                    : null,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(isSelected ? 6 : 8),
                child: Image.asset(
                  images[index],
                  fit: BoxFit.cover,
                  errorBuilder: (_, _, _) => ColoredBox(
                    color: colorScheme.primaryContainer,
                    child: Icon(
                      Icons.image_not_supported_outlined,
                      color: colorScheme.primary,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
