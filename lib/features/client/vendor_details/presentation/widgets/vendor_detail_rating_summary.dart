import 'package:eventra/core/utils/boxshadow_util.dart';
import 'package:eventra/core/utils/num_extensions.dart';
import 'package:flutter/material.dart';

class VendorDetailRatingSummary extends StatelessWidget {
  const VendorDetailRatingSummary({
    required this.rating,
    required this.reviewsCount,
    super.key,
  });

  final double rating;
  final int reviewsCount;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    const starDistributions = [
      (stars: 5, fraction: 0.6),
      (stars: 4, fraction: 0.2),
      (stars: 3, fraction: 0.1),
      (stars: 2, fraction: 0.05),
      (stars: 1, fraction: 0.05),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: BorderRadius.circular(12),
              boxShadow: boxShadowLight,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              child: Column(
                children: [
                  Text(
                    rating.toStringAsFixed(1),
                    style: 36.w700.copyWith(color: colorScheme.onSurface),
                  ),
                  Row(
                    children: List.generate(5, (i) {
                      return Icon(
                        i < rating.floor()
                            ? Icons.star_rounded
                            : Icons.star_border_rounded,
                        size: 14,
                        color: colorScheme.tertiary,
                      );
                    }),
                  ),
                  4.vertSpacing,
                  Text(
                    '$reviewsCount ratings',
                    style: 10.w400.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ),
          16.horizSpacing,
          Expanded(
            child: Column(
              children: starDistributions.map((dist) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Row(
                    children: [
                      Text(
                        '${dist.stars}',
                        style: 10.w400.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                      6.horizSpacing,
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: LinearProgressIndicator(
                            value: dist.fraction,
                            backgroundColor:
                                colorScheme.surfaceContainerHighest,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              colorScheme.primary,
                            ),
                            minHeight: 6,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
