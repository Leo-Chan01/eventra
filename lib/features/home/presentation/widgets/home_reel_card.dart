import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/home/domain/models/home_reel.dart';
import 'package:eventra/features/home/presentation/widgets/home_reel_action_column.dart';
import 'package:eventra/features/home/presentation/widgets/home_reel_center_controls.dart';
import 'package:eventra/features/home/presentation/widgets/home_reel_stats_bar.dart';
import 'package:eventra/features/home/presentation/widgets/home_reel_top_overlay_bar.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeReelCard extends StatelessWidget {
  const HomeReelCard({
    required this.reel,
    required this.onShare,
    required this.isVendorExperience,
    required this.onBack,
    required this.onPrevious,
    required this.onNext,
    required this.hasPrevious,
    required this.hasNext,
    super.key,
  });

  final HomeReel reel;
  final VoidCallback onShare;
  final bool isVendorExperience;
  final VoidCallback onBack;
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final bool hasPrevious;
  final bool hasNext;

  @override
  Widget build(BuildContext context) {
    if (!isVendorExperience) {
      return Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            reel.imagePath,
            fit: BoxFit.cover,
          ),
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0x00000000),
                  Color(0x00000000),
                  Color(0x14000000),
                  Color(0x26000000),
                  Color(0xAA000000),
                ],
              ),
            ),
          ),
          Align(
            child: SvgPicture.asset(
              EventraVectors.playWhiteIconPlay,
              height: 40,
              width: 40,
            ),
          ),
          Positioned(
            right: 16,
            bottom: MediaQuery.sizeOf(context).height * 0.12,
            child: HomeReelActionColumn(
              reel: reel,
              onShare: onShare,
            ),
          ),
          Positioned(
            left: 16,
            right: 84,
            bottom: MediaQuery.sizeOf(context).height * 0.03,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                12.horizSpacing,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        reel.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: 20.w700.copyWith(color: Colors.white),
                      ),
                      6.vertSpacing,
                      Text(
                        reel.caption,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: 14.w400.copyWith(
                          color: Colors.white,
                          height: 1.3,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }

    final colorScheme = Theme.of(context).colorScheme;
    final viewPadding = MediaQuery.paddingOf(context);

    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          reel.imagePath,
          fit: BoxFit.cover,
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                colorScheme.scrim.withValues(alpha: 0.2),
                colorScheme.scrim.withValues(alpha: 0.1),
                colorScheme.scrim.withValues(alpha: 0.08),
                colorScheme.scrim.withValues(alpha: 0.18),
                colorScheme.scrim.withValues(alpha: 0.4),
              ],
            ),
          ),
        ),
        Positioned(
          left: 20,
          right: 20,
          top: viewPadding.top + 12,
          child: HomeReelTopOverlayBar(
            reel: reel,
            onBack: onBack,
          ),
        ),
        Positioned(
          left: 24,
          right: 24,
          top: MediaQuery.sizeOf(context).height * 0.49,
          child: HomeReelCenterControls(
            hasPrevious: hasPrevious,
            hasNext: hasNext,
            onPrevious: onPrevious,
            onNext: onNext,
          ),
        ),
        Positioned(
          left: 20,
          right: 20,
          bottom: viewPadding.bottom + 18,
          child: HomeReelStatsBar(
            reel: reel,
            onShare: onShare,
          ),
        ),
      ],
    );
  }
}
