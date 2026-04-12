import 'package:eventra/core/utils/num_extensions.dart';
import 'package:flutter/material.dart';

class EnquiryContractBulletItem extends StatelessWidget {
  const EnquiryContractBulletItem({
    required this.text,
    required this.icon,
    required this.iconColor,
    this.iconSize = 14,
    super.key,
  });

  final String text;
  final IconData icon;
  final Color iconColor;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: iconSize, color: iconColor),
          8.horizSpacing,
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
