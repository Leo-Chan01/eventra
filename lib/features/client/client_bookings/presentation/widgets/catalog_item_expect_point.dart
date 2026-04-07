import 'package:eventra/core/utils/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class CatalogItemExpectPoint extends StatelessWidget {
  const CatalogItemExpectPoint({required this.text, super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          HugeIcon(
            icon: HugeIcons.strokeRoundedCheckmarkCircle01,
            size: 16,
            color: colorScheme.primary,
          ),
          10.horizSpacing,
          Expanded(
            child: Text(
              text,
              style: 13.w400.copyWith(color: colorScheme.onSurface),
            ),
          ),
        ],
      ),
    );
  }
}
