import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/vendor_details/domain/models/vendor_review.dart';
import 'package:flutter/material.dart';

class VendorReviewCard extends StatelessWidget {
  const VendorReviewCard({required this.review, super.key});

  final VendorReview review;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            ClipOval(
              child: Image.asset(
                review.reviewerAvatar,
                width: 36,
                height: 36,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) => Container(
                  width: 36,
                  height: 36,
                  color: colorScheme.primaryContainer,
                  child: Icon(
                    Icons.person,
                    color: colorScheme.primary,
                    size: 18,
                  ),
                ),
              ),
            ),
            10.horizSpacing,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    review.reviewerName,
                    style: 13.w600.copyWith(color: colorScheme.onSurface),
                  ),
                  4.vertSpacing,
                  Row(
                    children: [
                      ...List.generate(5, (i) {
                        return Icon(
                          i < review.rating.floor()
                              ? Icons.star_rounded
                              : Icons.star_border_rounded,
                          size: 12,
                          color: colorScheme.tertiary,
                        );
                      }),
                    ],
                  ),
                ],
              ),
            ),
            Text(
              review.date,
              style: 10.w400.copyWith(color: colorScheme.onSurfaceVariant),
            ),
          ],
        ),
        10.vertSpacing,
        Text(
          review.body,
          style: 12.w400.copyWith(
            color: colorScheme.onSurfaceVariant,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
