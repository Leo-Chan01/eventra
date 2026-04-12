import 'package:eventra/core/utils/num_extensions.dart';
import 'package:flutter/material.dart';

class EnquiryContractPartyCard extends StatelessWidget {
  const EnquiryContractPartyCard({
    required this.title,
    required this.firstLine,
    required this.secondLine,
    this.thirdLine,
    super.key,
  });

  final String title;
  final String firstLine;
  final String secondLine;
  final String? thirdLine;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: colorScheme.onSurfaceVariant.withValues(alpha: 0.03),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: colorScheme.outlineVariant.withValues(alpha: 0.1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: 14.w500.copyWith(color: colorScheme.onSurface)),
          4.vertSpacing,
          Text(
            firstLine,
            style: 13.w400.copyWith(color: colorScheme.onSurfaceVariant),
          ),
          Text(
            secondLine,
            style: 13.w400.copyWith(color: colorScheme.onSurfaceVariant),
          ),
          if (thirdLine != null && thirdLine!.isNotEmpty)
            Text(
              thirdLine!,
              style: 13.w400.copyWith(color: colorScheme.onSurfaceVariant),
            ),
        ],
      ),
    );
  }
}
