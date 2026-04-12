import 'dart:ui';

import 'package:flutter/material.dart';

enum EventraLikeButtonVariant { regular, blurGlass }

class EventraLikeButton extends StatelessWidget {
  const EventraLikeButton.regular({
    required this.isLiked,
    this.onTap,
    this.size = 40,
    this.iconSize = 24,
    super.key,
  }) : variant = EventraLikeButtonVariant.regular;

  const EventraLikeButton.blurGlassVersion({
    required this.isLiked,
    this.onTap,
    this.size = 40,
    this.iconSize = 24,
    super.key,
  }) : variant = EventraLikeButtonVariant.blurGlass;

  final bool isLiked;
  final VoidCallback? onTap;
  final double size;
  final double iconSize;
  final EventraLikeButtonVariant variant;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      width: size,
      height: size,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          customBorder: const CircleBorder(),
          child: variant == EventraLikeButtonVariant.blurGlass
              ? ClipOval(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: colorScheme.surface.withValues(alpha: 0.35),
                        border: Border.all(
                          color: colorScheme.surface.withValues(alpha: 0.75),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Icon(
                        isLiked
                            ? Icons.favorite_rounded
                            : Icons.favorite_border_rounded,
                        color: isLiked
                            ? colorScheme.primary
                            : colorScheme.onSurface,
                        size: iconSize,
                      ),
                    ),
                  ),
                )
              : Container(
                  decoration: BoxDecoration(
                    color: colorScheme.surface,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Icon(
                    isLiked
                        ? Icons.favorite_rounded
                        : Icons.favorite_border_rounded,
                    color: isLiked
                        ? colorScheme.primary
                        : colorScheme.onSurfaceVariant,
                    size: iconSize,
                  ),
                ),
        ),
      ),
    );
  }
}
