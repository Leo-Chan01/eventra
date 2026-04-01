import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/home/domain/models/vendor.dart';
import 'package:flutter/material.dart';

class VendorCardWeek extends StatelessWidget {
  const VendorCardWeek({
    required this.vendor,
    super.key,
  });

  final Vendor vendor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: colorScheme.outline.withValues(alpha: 0.1),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              vendor.image,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 100,
                height: 100,
                color: colorScheme.primaryContainer,
                child: Icon(
                  Icons.image_not_supported_outlined,
                  color: colorScheme.primary,
                ),
              ),
            ),
          ),
          16.horizSpacing,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      vendor.name,
                      style: 16.bold.copyWith(
                        color: colorScheme.onSurface,
                      ),
                    ),
                    Icon(
                      vendor.isFavorite
                          ? Icons.favorite_rounded
                          : Icons.favorite_border_rounded,
                      color: vendor.isFavorite ? Colors.red : Colors.grey,
                      size: 20,
                    ),
                  ],
                ),
                4.vertSpacing,
                Text(
                  vendor.category,
                  style: 12.regular.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                12.vertSpacing,
                Row(
                  children: [
                    const Icon(
                      Icons.star_rounded,
                      color: Colors.amber,
                      size: 16,
                    ),
                    4.horizSpacing,
                    Text(
                      '${vendor.rating} (${vendor.reviewsCount} reviews)',
                      style: 12.w500.copyWith(
                        color: colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
