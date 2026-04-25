import 'package:eventra/core/utils/boxshadow_util.dart';
import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/client_bookings/presentation/widgets/vendor_rating_stars.dart';
import 'package:flutter/material.dart';

class VendorCompletedJobReviewCard extends StatelessWidget {
  const VendorCompletedJobReviewCard({
    required this.avatarImage,
    required this.reviewerName,
    required this.reviewDate,
    required this.rating,
    required this.reviewBody,
    super.key,
  });

  final String avatarImage;
  final String reviewerName;
  final String reviewDate;
  final double rating;
  final String reviewBody;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(12),
        boxShadow: boxShadowLight,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(999),
                child: Image.asset(
                  avatarImage,
                  width: 56,
                  height: 56,
                  fit: BoxFit.cover,
                ),
              ),
              14.horizSpacing,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      reviewerName,
                      style: 16.w700.copyWith(color: colorScheme.onSurface),
                    ),
                    6.vertSpacing,
                    Row(
                      children: [
                        VendorRatingStars(stars: rating, starSize: 14),
                        6.horizSpacing,
                        Text(
                          '(${rating.toStringAsFixed(1)})',
                          style: 14.w500.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              10.horizSpacing,
              Text(
                reviewDate,
                style: 12.w500.copyWith(color: colorScheme.onSurfaceVariant),
              ),
            ],
          ),
          14.vertSpacing,
          Text(
            reviewBody,
            style: 14.w500.copyWith(
              color: colorScheme.onSurfaceVariant,
              height: 1.45,
            ),
          ),
        ],
      ),
    );
  }
}
