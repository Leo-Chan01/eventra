import 'package:eventra/core/utils/boxshadow_util.dart';
import 'package:eventra/features/home/presentation/widgets/vendor_quick_stat_column.dart';
import 'package:flutter/material.dart';

class VendorQuickStatsCard extends StatelessWidget {
  const VendorQuickStatsCard({
    required this.earnings,
    required this.reviewsCount,
    required this.listingsCount,
    required this.earningsLabel,
    required this.reviewsLabel,
    required this.listingsLabel,
    super.key,
  });

  final String earnings;
  final String reviewsCount;
  final String listingsCount;
  final String earningsLabel;
  final String reviewsLabel;
  final String listingsLabel;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(10),
        boxShadow: boxShadowLight,
      ),
      child: Row(
        children: [
          Expanded(
            child: VendorQuickStatColumn(
              value: earnings,
              label: earningsLabel,
            ),
          ),
          Container(
            width: 1,
            height: 68,
            color: colorScheme.outlineVariant.withValues(alpha: 0.2),
          ),
          Expanded(
            child: VendorQuickStatColumn(
              value: reviewsCount,
              label: reviewsLabel,
              extra: '(4.8)',
            ),
          ),
          Container(
            width: 1,
            height: 68,
            color: colorScheme.outlineVariant.withValues(alpha: 0.2),
          ),
          Expanded(
            child: VendorQuickStatColumn(
              value: listingsCount,
              label: listingsLabel,
            ),
          ),
        ],
      ),
    );
  }
}
