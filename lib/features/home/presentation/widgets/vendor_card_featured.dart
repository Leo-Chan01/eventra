import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/home/domain/models/vendor.dart';
import 'package:flutter/material.dart';

class VendorCardFeatured extends StatelessWidget {
  const VendorCardFeatured({
    required this.vendor,
    this.onTap,
    super.key,
  });

  final Vendor vendor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 188,
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                  child: Image.asset(
                    vendor.image,
                    height: 118,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 118,
                      color: colorScheme.primaryContainer,
                      child: Icon(
                        Icons.image_not_supported_outlined,
                        color: colorScheme.primary,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: colorScheme.surface.withValues(alpha: 0.9),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      vendor.isFavorite
                          ? Icons.favorite_rounded
                          : Icons.favorite_border_rounded,
                      color: vendor.isFavorite
                          ? colorScheme.error
                          : colorScheme.onSurfaceVariant,
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    vendor.name,
                    style: 15.w700.copyWith(color: colorScheme.onSurface),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  4.vertSpacing,
                  Text(
                    vendor.location,
                    style: 12.w400.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  8.vertSpacing,
                  Row(
                    children: [
                      Icon(
                        Icons.star_rounded,
                        color: colorScheme.tertiary,
                        size: 16,
                      ),
                      4.horizSpacing,
                      Text(
                        '${vendor.rating} (${vendor.reviewsCount})',
                        style: 12.w500.copyWith(color: colorScheme.onSurface),
                      ),
                    ],
                  ),
                  8.vertSpacing,
                  Text(
                    vendor.startingPrice.getValue,
                    style: 12.w700.copyWith(color: colorScheme.primary),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
