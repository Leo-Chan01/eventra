import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LastUpdatedBanner extends StatelessWidget {
  const LastUpdatedBanner({required this.l10n, super.key});

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: colorScheme.primary.withValues(alpha: 0.5),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                EventraVectors.infoIcon,
                width: 16,
                height: 16,
                colorFilter: ColorFilter.mode(
                  colorScheme.primary,
                  BlendMode.srcIn,
                ),
              ),
              8.horizSpacing,
              Text(
                l10n.lastUpdated,
                style: 12.bold.copyWith(color: colorScheme.primary),
              ),
            ],
          ),
          4.vertSpacing,
          Text(
            l10n.lastUpdatedDate,
            style: 14.w500.copyWith(color: colorScheme.primary),
          ),
        ],
      ),
    );
  }
}
