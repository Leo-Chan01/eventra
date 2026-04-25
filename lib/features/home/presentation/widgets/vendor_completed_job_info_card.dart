import 'package:eventra/core/utils/boxshadow_util.dart';
import 'package:eventra/features/home/presentation/widgets/vendor_completed_job_info_row.dart';
import 'package:flutter/material.dart';

class VendorCompletedJobInfoCardRowData {
  const VendorCompletedJobInfoCardRowData({
    required this.label,
    required this.value,
    this.isHighlightedValue = false,
  });

  final String label;
  final String value;
  final bool isHighlightedValue;
}

class VendorCompletedJobInfoCard extends StatelessWidget {
  const VendorCompletedJobInfoCard({
    required this.rows,
    super.key,
  });

  final List<VendorCompletedJobInfoCardRowData> rows;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(10),
        boxShadow: boxShadowLight,
      ),
      child: Column(
        children: rows.asMap().entries.map((entry) {
          final index = entry.key;
          final row = entry.value;
          final isLast = index == rows.length - 1;

          return Column(
            children: [
              VendorCompletedJobInfoRow(
                label: row.label,
                value: row.value,
                isHighlightedValue: row.isHighlightedValue,
              ),
              if (!isLast)
                Divider(
                  color: colorScheme.outline.withValues(alpha: 0.2),
                  height: 1,
                ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
