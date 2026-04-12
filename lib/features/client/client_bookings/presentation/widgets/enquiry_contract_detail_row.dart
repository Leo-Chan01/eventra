import 'package:eventra/core/utils/boxshadow_util.dart';
import 'package:eventra/core/utils/num_extensions.dart';
import 'package:flutter/material.dart';

class EnquiryContractDetailRow extends StatelessWidget {
  const EnquiryContractDetailRow({
    required this.label,
    required this.value,
    this.emphasized = false,
    this.showDivider = true,
    this.isStacked = false,
    super.key,
  });

  final String label;
  final String value;
  final bool emphasized;
  final bool showDivider;
  final bool isStacked;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: isStacked
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: 14.w600.copyWith(color: colorScheme.onSurface),
                    ),
                    6.vertSpacing,
                    Text(
                      value,
                      style: 14.w400.copyWith(color: colorScheme.onSurface),
                    ),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        label,
                        style: 14.w500.copyWith(color: colorScheme.onSurface),
                      ),
                    ),
                    8.horizSpacing,
                    Expanded(
                      child: Text(
                        value,
                        textAlign: TextAlign.end,
                        style: 14.w500.copyWith(
                          fontWeight: emphasized
                              ? FontWeight.w700
                              : FontWeight.w500,
                          color: emphasized
                              ? colorScheme.primary
                              : colorScheme.onSurface,
                        ),
                      ),
                    ),
                  ],
                ),
        ),
        if (showDivider) standardDividerUtil(context),
      ],
    );
  }
}
