import 'package:eventra/features/home/domain/models/home_reel.dart';
import 'package:eventra/features/home/presentation/widgets/home_reel_card.dart';
import 'package:flutter/material.dart';

class HomeReelsTab extends StatelessWidget {
  const HomeReelsTab({
    required this.reels,
    required this.onShareReel,
    super.key,
  });

  final List<HomeReel> reels;
  final ValueChanged<HomeReel> onShareReel;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      key: const Key('home_reels_feed'),
      scrollDirection: Axis.vertical,
      itemCount: reels.length,
      itemBuilder: (context, index) {
        final reel = reels[index];
        return HomeReelCard(
          reel: reel,
          onShare: () => onShareReel(reel),
        );
      },
    );
  }
}
