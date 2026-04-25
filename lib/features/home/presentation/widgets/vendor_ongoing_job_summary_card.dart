import 'package:eventra/core/utils/boxshadow_util.dart';
import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VendorOngoingJobSummaryCard extends StatelessWidget {
  const VendorOngoingJobSummaryCard({
    required this.vendorImage,
    required this.vendorName,
    required this.invoiceIdLabel,
    required this.dateIssuedLabel,
    required this.onMessageVendor,
    super.key,
  });

  final String vendorImage;
  final String vendorName;
  final String invoiceIdLabel;
  final String dateIssuedLabel;
  final VoidCallback onMessageVendor;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(10),
        boxShadow: boxShadowLight,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: Image.asset(
              vendorImage,
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
          16.horizSpacing,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  vendorName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: 20.w700.copyWith(color: colorScheme.onSurface),
                ),
                8.vertSpacing,
                Text(
                  invoiceIdLabel,
                  style: 14.w500.copyWith(color: colorScheme.onSurfaceVariant),
                ),
                8.vertSpacing,
                Text(
                  dateIssuedLabel,
                  style: 14.w500.copyWith(color: colorScheme.onSurfaceVariant),
                ),
              ],
            ),
          ),
          12.horizSpacing,
          InkWell(
            onTap: onMessageVendor,
            borderRadius: BorderRadius.circular(999),
            child: Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerHigh,
                shape: BoxShape.circle,
                border: Border.all(
                  color: colorScheme.outline.withValues(alpha: 0.4),
                ),
              ),
              child: Center(
                child: SvgPicture.asset(
                  EventraVectors.messagesChatBlackGrey,
                  colorFilter: ColorFilter.mode(
                    colorScheme.primary,
                    BlendMode.srcIn,
                  ),
                  width: 24,
                  height: 24,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
