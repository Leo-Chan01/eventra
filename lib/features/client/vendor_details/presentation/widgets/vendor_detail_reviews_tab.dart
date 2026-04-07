import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/vendor_details/domain/models/vendor_review.dart';
import 'package:eventra/features/client/vendor_details/presentation/widgets/vendor_detail_rating_summary.dart';
import 'package:eventra/features/client/vendor_details/presentation/widgets/vendor_review_card.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:flutter/material.dart';

class VendorDetailReviewsTab extends StatelessWidget {
  const VendorDetailReviewsTab({
    required this.rating,
    required this.reviewsCount,
    required this.reviews,
    super.key,
  });

  final double rating;
  final int reviewsCount;
  final List<VendorReview> reviews;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 120),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.vendorDetailRatingReviews(reviewsCount),
            style: 14.w700.copyWith(color: colorScheme.onSurface),
          ),
          16.vertSpacing,
          VendorDetailRatingSummary(rating: rating, reviewsCount: reviewsCount),
          24.vertSpacing,
          ...reviews.map((review) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                children: [
                  VendorReviewCard(review: review),
                  if (reviews.last != review) ...[
                    16.vertSpacing,
                    Divider(
                      color: colorScheme.outlineVariant.withValues(alpha: 0.4),
                    ),
                  ],
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
