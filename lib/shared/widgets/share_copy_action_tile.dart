import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShareCopyActionTile extends StatelessWidget {
  const ShareCopyActionTile({
    required this.label,
    required this.onTap,
    super.key,
  });

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      key: const Key('share_copy_action_tile'),
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 11),
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.45),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                label,
                style: 16.w400.copyWith(color: colorScheme.onSurface),
              ),
            ),
            SvgPicture.asset(
              EventraVectors.copyBlackIcon,
            ),
          ],
        ),
      ),
    );
  }
}
