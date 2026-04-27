import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/home/domain/models/home_reel.dart';
import 'package:eventra/shared/widgets/eventra_buttons/eventra_nav_button.dart';
import 'package:flutter/material.dart';

class HomeReelTopOverlayBar extends StatelessWidget {
  const HomeReelTopOverlayBar({
    required this.reel,
    required this.onBack,
    super.key,
  });

  final HomeReel reel;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        InkWell(
          key: const Key('home_reel_back_button'),
          onTap: onBack,
          child: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: colorScheme.surface.withValues(alpha: 0.3),
              shape: BoxShape.circle,
            ),
            child: const EventraNavButton.blurGlassVersion(
              isNext: false,
            ),
          ),
        ),
        12.horizSpacing,
        Expanded(
          child: Text(
            reel.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: 18.w600.copyWith(
              color: colorScheme.onPrimary,
            ),
          ),
        ),
        12.horizSpacing,
        ClipOval(
          child: Image.asset(
            reel.creatorAvatarPath,
            width: 48,
            height: 48,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
