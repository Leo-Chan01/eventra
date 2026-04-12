import 'package:eventra/core/utils/num_extensions.dart';
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
    this.subtitle,
    this.ratingLabel,
    super.key,
  });

  final String vendorImage;
  final String vendorName;
  final String invoiceIdLabel;
  final String dateIssuedLabel;
  final String statusLabel;
  final String statusValue;
  final Color statusColor;
  final VoidCallback onMessageVendor;
  final String? subtitle;
  final String? ratingLabel;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                  invoiceIdLabel,
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
                        style: 14.w600.copyWith(color: statusColor),
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
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colorScheme.primaryContainer.withValues(alpha: 0.45),
              ),
              child: Center(
                child: SvgPicture.asset(
                  EventraVectors.messagesChatBlackGrey,
                  width: 20,
                  height: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
