import 'package:eventra/core/utils/boxshadow_util.dart';
import 'package:eventra/core/utils/num_extensions.dart';
import 'package:flutter/material.dart';

class HomeProfileStatCard extends StatelessWidget {
  const HomeProfileStatCard({
    required this.value,
    required this.label,
    super.key,
  });

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(24),
        boxShadow: boxShadowLight,
      ),
      child: Column(
        children: [
          Text(
            value,
            style: 22.w700.copyWith(color: colorScheme.onSurface),
          ),
          8.vertSpacing,
          Text(
            label,
            textAlign: TextAlign.center,
            style: 13.w500.copyWith(color: colorScheme.onSurfaceVariant),
          ),
        ],
      ),
    );
  }
}
