import 'package:eventra/core/utils/boxshadow_util.dart';
import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CompletedEnquiryVendorSummaryCard extends StatelessWidget {
  const CompletedEnquiryVendorSummaryCard({
    required this.vendorImage,
    required this.vendorName,
    required this.invoiceIdLabel,
    required this.dateIssuedLabel,
    required this.statusPrefix,
    required this.statusLabel,
    required this.statusColor,
    required this.onMessageVendor,
    super.key,
  });

  final String vendorImage;
  final String vendorName;
  final String invoiceIdLabel;
  final String dateIssuedLabel;
  final String statusPrefix;
  final String statusLabel;
  final Color statusColor;
  final VoidCallback onMessageVendor;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(18),
        boxShadow: boxShadowLight,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: Image.asset(
              vendorImage,
              width: 92,
              height: 92,
              fit: BoxFit.cover,
            ),
          ),
          18.horizSpacing,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text(
                        vendorName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: 19.w700.copyWith(color: colorScheme.onSurface),
                      ),
                    ),
                    Expanded(
                      child: SvgPicture.asset(
                        EventraVectors.verify,
                        height: 28,
                        width: 28,
                      ),
                    ),
                  ],
                ),
                10.vertSpacing,
                Text(
                  invoiceIdLabel,
                  style: 15.w400.copyWith(color: colorScheme.onSurfaceVariant),
                ),
                8.vertSpacing,
                Text(
                  dateIssuedLabel,
                  style: 15.w400.copyWith(color: colorScheme.onSurfaceVariant),
                ),
                8.vertSpacing,
                RichText(
                  text: TextSpan(
                    text: statusPrefix,
                    style: 15.w400.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                    children: [
                      TextSpan(
                        text: statusLabel,
                        style: 15.w500.copyWith(color: statusColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          14.horizSpacing,
          InkWell(
            onTap: onMessageVendor,
            borderRadius: BorderRadius.circular(999),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: colorScheme.primary, width: 1.5),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: SvgPicture.asset(EventraVectors.messagesChatBlackGrey),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
