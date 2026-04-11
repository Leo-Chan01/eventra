import 'package:eventra/core/utils/boxshadow_util.dart';
import 'package:eventra/core/utils/num_extensions.dart';
import 'package:flutter/material.dart';

class HomeProfileInfoCard extends StatelessWidget {
  const HomeProfileInfoCard({
    required this.label,
    required this.value,
    super.key,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(14),
        boxShadow: boxShadowLight,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: 13.w500.copyWith(color: colorScheme.onSurfaceVariant),
          ),
          10.vertSpacing,
          Text(
            value,
            style: 15.w500.copyWith(color: colorScheme.onSurface),
          ),
        ],
      ),
    );
  }
}
