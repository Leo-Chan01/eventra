import 'dart:ui';

import 'package:eventra/features/home/domain/models/home_reel.dart';
import 'package:eventra/features/home/presentation/widgets/home_reel_stat_item.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';

class HomeReelStatsBar extends StatelessWidget {
  const HomeReelStatsBar({
    required this.reel,
    required this.onShare,
    super.key,
  });

  final HomeReel reel;
  final VoidCallback onShare;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
        child: Container(
          key: const Key('home_reel_stats_bar'),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          decoration: BoxDecoration(
            color: colorScheme.surface.withValues(alpha: 0.35),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: colorScheme.onPrimary.withValues(alpha: 0.6),
            ),
          ),
          child: Row(
            children: [
              HomeReelStatItem(
                iconPath: EventraVectors.eyeViewsIcon,
                count: reel.viewCount,
              ),
              HomeReelStatItem(
                iconPath: EventraVectors.streamlineUltimateLikeBold,
                count: reel.likeCount,
              ),
              HomeReelStatItem(
                iconPath: EventraVectors.mageShareVideoIcon,
                count: reel.shareCount,
                onTap: onShare,
              ),
              HomeReelStatItem(
                iconPath: EventraVectors.solarLikeBrokenSaveVideoIcon,
                count: reel.saveCount,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
