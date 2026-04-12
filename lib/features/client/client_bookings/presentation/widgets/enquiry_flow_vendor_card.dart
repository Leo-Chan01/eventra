import 'package:eventra/core/utils/boxshadow_util.dart';
import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/client_bookings/presentation/widgets/vendor_rating_stars.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EnquiryFlowVendorCard extends StatelessWidget {
  const EnquiryFlowVendorCard({
    required this.vendorImage,
    required this.vendorName,
    required this.invoiceIdLabel,
    required this.dateIssuedLabel,
    required this.statusLabel,
    required this.statusValue,
    required this.statusColor,
    required this.onMessageVendor,
    this.isMinimal = false,
    this.subtitle,
    this.ratingLabel,
    super.key,
  });

  const EnquiryFlowVendorCard.minimal({
    required this.vendorImage,
    required this.vendorName,
    required this.dateIssuedLabel,
    required this.statusLabel,
    required this.statusValue,
    required this.statusColor,
    required this.onMessageVendor,
    this.invoiceIdLabel,
    this.subtitle,
    this.ratingLabel,
    this.isMinimal = true,
    super.key,
  });

  final String vendorImage;
  final String vendorName;
  final String? invoiceIdLabel;
  final String dateIssuedLabel;
  final String statusLabel;
  final String statusValue;
  final Color statusColor;
  final VoidCallback onMessageVendor;
  final String? subtitle;
  final String? ratingLabel;
  final bool isMinimal;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    if (isMinimal) {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(18),
          boxShadow: boxShadowLight,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(999),
              child: Image.asset(
                vendorImage,
                width: 72,
                height: 72,
                fit: BoxFit.cover,
              ),
            ),
            12.horizSpacing,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          vendorName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: 18.w700.copyWith(color: colorScheme.onSurface),
                        ),
                      ),
                      8.horizSpacing,
                      SvgPicture.asset(
                        EventraVectors.verify,
                        width: 20,
                        height: 20,
                      ),
                    ],
                  ),
                  if (subtitle != null) ...[
                    6.vertSpacing,
                    Text(
                      subtitle!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: 13.w400.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                  if (ratingLabel != null) ...[
                    4.vertSpacing,
                    Row(
                      children: [
                        const VendorRatingStars(stars: 4.5, starSize: 14),
                        4.horizSpacing,
                        Text(
                          ratingLabel!,
                          style: 13.w500.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
            10.horizSpacing,
            InkWell(
              onTap: onMessageVendor,
              borderRadius: BorderRadius.circular(999),
              child: Container(
                width: 44,
                height: 44,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    EventraVectors.chatMessage,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(18),
        boxShadow: boxShadowLight,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: Image.asset(
              vendorImage,
              width: 72,
              height: 72,
              fit: BoxFit.cover,
            ),
          ),
          12.horizSpacing,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        vendorName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: 18.w700.copyWith(color: colorScheme.onSurface),
                      ),
                    ),
                    8.horizSpacing,
                    SvgPicture.asset(
                      EventraVectors.verify,
                      width: 20,
                      height: 20,
                    ),
                  ],
                ),
                if (subtitle != null) ...[
                  6.vertSpacing,
                  Text(
                    subtitle!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: 13.w400.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
                if (ratingLabel != null) ...[
                  4.vertSpacing,
                  Text(
                    ratingLabel!,
                    style: 13.w500.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
                6.vertSpacing,
                Text(
                  invoiceIdLabel!,
                  style: 14.w400.copyWith(color: colorScheme.onSurfaceVariant),
                ),
                4.vertSpacing,
                Text(
                  dateIssuedLabel,
                  style: 14.w400.copyWith(color: colorScheme.onSurfaceVariant),
                ),
                4.vertSpacing,
                RichText(
                  text: TextSpan(
                    text: statusLabel,
                    style: 14.w400.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                    children: [
                      TextSpan(
                        text: statusValue,
                        style: 14.w400.copyWith(color: statusColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          10.horizSpacing,
          InkWell(
            onTap: onMessageVendor,
            borderRadius: BorderRadius.circular(999),
            child: Container(
              width: 44,
              height: 44,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Center(
                child: SvgPicture.asset(
                  EventraVectors.chatMessage,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
