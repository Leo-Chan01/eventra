import 'package:eventra/core/utils/boxshadow_util.dart';
import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/home/domain/models/vendor.dart';
import 'package:flutter/material.dart';

class HomeEnquiryVendorCard extends StatelessWidget {
  const HomeEnquiryVendorCard({
    required this.vendor,
    required this.dateLabel,
    super.key,
  });

  final Vendor vendor;
  final String dateLabel;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        boxShadow: boxShadowLight,
      ),
      child: Row(
        children: [
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                vendor.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          16.horizSpacing,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  vendor.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: 21.w700.copyWith(color: colorScheme.onSurface),
                ),
                6.vertSpacing,
                Text(
                  vendor.category,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: 17.w400.copyWith(color: colorScheme.onSurfaceVariant),
                ),
                10.vertSpacing,
                Text(
                  dateLabel,
                  style: 17.w400.copyWith(color: colorScheme.onSurfaceVariant),
                ),
              ],
            ),
          ),
          8.horizSpacing,
          Icon(
            Icons.chevron_right_rounded,
            size: 38,
            color: colorScheme.onSurfaceVariant,
          ),
        ],
      ),
    );
  }
}
