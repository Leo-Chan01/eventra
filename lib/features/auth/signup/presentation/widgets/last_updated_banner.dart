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
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFEBF5FF),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFF7CB9FF).withValues(alpha: 0.5),
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
                colorFilter: const ColorFilter.mode(
                  Color(0xFF0078FF),
                  BlendMode.srcIn,
                ),
              ),
              8.horizSpacing,
              Text(
                l10n.lastUpdated,
                style: 12.bold.copyWith(color: const Color(0xFF0078FF)),
              ),
            ],
          ),
          4.vertSpacing,
          Text(
            l10n.lastUpdatedDate,
            style: 14.w500.copyWith(color: const Color(0xFF0078FF)),
          ),
        ],
      ),
    );
  }
}
