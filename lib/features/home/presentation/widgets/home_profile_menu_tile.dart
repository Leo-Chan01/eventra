import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeProfileMenuTile extends StatelessWidget {
  const HomeProfileMenuTile({
    required this.iconPath,
    required this.label,
    required this.onTap,
    super.key,
  });

  final String iconPath;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
        child: Row(
          children: [
            SvgPicture.asset(
              iconPath,
              width: 40,
              height: 40,
            ),
            16.horizSpacing,
            Expanded(
              child: Text(
                label,
                style: 16.w600.copyWith(color: colorScheme.onSurface),
              ),
            ),
            SvgPicture.asset(
              EventraVectors.angleLeft,
              width: 18,
              height: 18,
            ),
          ],
        ),
      ),
    );
  }
}
