import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/home/domain/models/home_reel.dart';
import 'package:eventra/features/home/presentation/widgets/home_reel_action_item.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';

class HomeReelActionColumn extends StatelessWidget {
  const HomeReelActionColumn({
    required this.reel,
    required this.onShare,
    super.key,
  });

  final HomeReel reel;
  final VoidCallback onShare;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(2),
          child: ClipOval(
            child: Image.asset(
              reel.creatorAvatarPath,
              fit: BoxFit.cover,
            ),
          ),
        ),
        18.vertSpacing,
        HomeReelActionItem(
          icon: EventraVectors.streamlineUltimateLikeBold,
          count: reel.likeCount,
        ),
        18.vertSpacing,
        HomeReelActionItem(
          icon: EventraVectors.mageShareVideoIcon,
          count: reel.shareCount,
          onTap: onShare,
        ),
        18.vertSpacing,
        HomeReelActionItem(
          icon: EventraVectors.solarLikeBrokenSaveVideoIcon,
          count: reel.saveCount,
        ),
      ],
    );
  }
}
