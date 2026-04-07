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
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.18),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
            child: Image.asset(
              vendor.image,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                height: 120,
                width: double.infinity,
                color: colorScheme.primaryContainer,
                child: Icon(
                  Icons.image_not_supported_outlined,
                  color: colorScheme.primary,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  vendor.name,
                  style: 14.w700.copyWith(color: colorScheme.onSurface),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                4.vertSpacing,
                Row(
                  children: [
                    Icon(
                      Icons.star_rounded,
                      color: colorScheme.tertiary,
                      size: 16,
                    ),
                    4.horizSpacing,
                    Text(
                      '${vendor.rating}',
                      style: 12.w600.copyWith(color: colorScheme.onSurface),
                    ),
                  ],
                ),
                6.vertSpacing,
                Text(
                  vendor.startingPrice.getValue,
                  style: 12.w700.copyWith(color: colorScheme.primary),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
