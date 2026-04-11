import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/home/domain/models/home_reel.dart';
import 'package:eventra/features/home/presentation/widgets/home_reel_action_column.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeReelCard extends StatelessWidget {
  const HomeReelCard({
    required this.reel,
    required this.onShare,
    super.key,
  });

  final HomeReel reel;
  final VoidCallback onShare;

  @override
  Widget build(BuildContext context) {
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
            height: 58,
            width: 58,
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
}
