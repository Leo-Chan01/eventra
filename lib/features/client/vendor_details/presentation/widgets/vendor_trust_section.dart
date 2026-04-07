import 'package:eventra/core/utils/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class VendorTrustItem extends StatelessWidget {
  const VendorTrustItem({
    required this.label,
    required this.icon,
    super.key,
  });

  final String label;
  final List<List<dynamic>> icon;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          HugeIcon(icon: icon, size: 16, color: colorScheme.primary),
          8.horizSpacing,
          Expanded(
            child: Text(
              label,
              style: 13.w400.copyWith(color: colorScheme.onSurface),
            ),
          ),
        ],
      ),
    );
  }
}

class VendorTrustSection extends StatelessWidget {
  const VendorTrustSection({
    required this.title,
    required this.items,
    super.key,
  });

  final String title;
  final List<({String label, List<List<dynamic>> icon})> items;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: 14.w700.copyWith(color: colorScheme.onSurface)),
        10.vertSpacing,
        ...items.map(
          (item) => VendorTrustItem(label: item.label, icon: item.icon),
        ),
      ],
    );
  }
}
