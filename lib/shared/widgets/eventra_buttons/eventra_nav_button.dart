import 'dart:ui';

import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum EventraNavButtonVariant { regular, blurGlass }

class EventraNavButton extends StatelessWidget {
  const EventraNavButton.regular({
    required this.isLiked,
    this.onTap,
    this.size = 40,
    this.iconSize = 24,
    super.key,
  }) : variant = EventraNavButtonVariant.regular;

  const EventraNavButton.blurGlassVersion({
    required this.isLiked,
    this.onTap,
    this.size = 40,
    this.iconSize = 24,
    super.key,
  }) : variant = EventraNavButtonVariant.blurGlass;

  final bool isLiked;
  final VoidCallback? onTap;
  final double size;
  final double iconSize;
  final EventraNavButtonVariant variant;

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
          child: variant == EventraNavButtonVariant.blurGlass
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
                      child: SvgPicture.asset(
                        isLiked
                            ? EventraVectors.nextPageArrowIcon
                            : EventraVectors.nextPageArrowIcon,
                        color: isLiked
                            ? colorScheme.primary
                            : colorScheme.onSurface,
                        height: iconSize,
                        width: iconSize,
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
                  child: SvgPicture.asset(
                    isLiked
                        ? EventraVectors.nextPageArrowIcon
                        : EventraVectors.nextPageArrowIcon,
                    color: isLiked
                        ? colorScheme.primary
                        : colorScheme.onSurfaceVariant,
                    width: iconSize,
                    height: iconSize,
                  ),
                ),
        ),
      ),
    );
  }
}
