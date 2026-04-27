import 'package:eventra/shared/widgets/eventra_buttons/eventra_nav_button.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class HomeReelCenterControls extends StatelessWidget {
  const HomeReelCenterControls({
    required this.onPrevious,
    required this.onNext,
    required this.hasPrevious,
    required this.hasNext,
    super.key,
  });

  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final bool hasPrevious;
  final bool hasNext;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          key: const Key('home_reel_previous_button'),
          onTap: hasPrevious ? onPrevious : null,
          borderRadius: BorderRadius.circular(999),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: colorScheme.surface.withValues(alpha: 0.24),
              shape: BoxShape.circle,
            ),
            child: const EventraNavButton.clearType(isNext: false),
          ),
        ),
        Container(
          width: 54,
          height: 54,
          decoration: BoxDecoration(
            color: colorScheme.surface.withValues(alpha: 0.4),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: HugeIcon(
              icon: HugeIcons.strokeRoundedPlay,
              color: colorScheme.onPrimary,
              size: 40,
            ),
          ),
        ),
        InkWell(
          key: const Key('home_reel_next_button'),
          onTap: hasNext ? onNext : null,
          borderRadius: BorderRadius.circular(999),
          child: const SizedBox(
            width: 40,
            height: 40,
            child: EventraNavButton.regular(isNext: true),
          ),
        ),
      ],
    );
  }
}
