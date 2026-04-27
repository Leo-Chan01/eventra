import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VendorBookingsOverviewCard extends StatelessWidget {
  const VendorBookingsOverviewCard({
    required this.count,
    required this.title,
    super.key,
  });

  final String count;
  final String title;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AspectRatio(
      aspectRatio: 77 / 58,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: colorScheme.outline.withValues(alpha: 0.08),
            width: 1.5,
          ),
          // boxShadow: boxShadowLight,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 34,
                height: 34,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerHighest.withValues(
                    alpha: 0.2,
                  ),
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(EventraVectors.outgoingSendArrowIcon),
              ),
            ),
            const Spacer(),
            Text(
              count,
              style: 24.w800.copyWith(color: colorScheme.onSurface),
            ),
            4.vertSpacing,
            Text(
              title,
              style: 16.w500.copyWith(color: colorScheme.onSurface),
            ),
          ],
        ),
      ),
    );
  }
}
