import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hugeicons/hugeicons.dart';

class VendorServiceItem extends StatelessWidget {
  const VendorServiceItem({required this.label, super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          SvgPicture.asset(
            EventraVectors.goodCheckGreen,
            width: 16,
            height: 16,
            colorFilter: ColorFilter.mode(
              colorScheme.onSurfaceVariant,
              BlendMode.srcIn,
            ),
          ),
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
