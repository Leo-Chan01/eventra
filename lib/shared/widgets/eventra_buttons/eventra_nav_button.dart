import 'dart:ui';

import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum EventraNavButtonVariant { regular, blurGlass, clear }

class EventraNavButton extends StatelessWidget {
  const EventraNavButton.regular({
    required this.isNext,
    this.onTap,
    this.size = 40,
    this.iconSize = 24,
    this.hasBorder = true,
    super.key,
  }) : variant = EventraNavButtonVariant.regular;

  const EventraNavButton.blurGlassVersion({
    required this.isNext,
    this.onTap,
    this.size = 40,
    this.iconSize = 24,
    this.hasBorder = true,
    super.key,
  }) : variant = EventraNavButtonVariant.blurGlass;

  const EventraNavButton.clearType({
    required this.isNext,
    this.onTap,
    this.size = 40,
    this.iconSize = 24,
    this.hasBorder = true,
    super.key,
  }) : variant = EventraNavButtonVariant.clear;

  final bool isNext;
  final VoidCallback? onTap;
  final double size;
  final double iconSize;
  final EventraNavButtonVariant variant;
  final bool hasBorder;

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
          child: switch (variant) {
            EventraNavButtonVariant.blurGlass => ClipOval(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: colorScheme.surface.withValues(alpha: 0.10),
                    border: hasBorder
                        ? Border.all(
                            color: colorScheme.surface.withValues(alpha: 0.75),
                          )
                        : null,
                  ),
                  alignment: Alignment.center,
                  child: RotatedBox(
                    quarterTurns: isNext ? 0 : 2,
                    child: SvgPicture.asset(
                      EventraVectors.angleLeft,
                      colorFilter: ColorFilter.mode(
                        colorScheme.onPrimary,
                        BlendMode.srcIn,
                      ),
                      height: iconSize,
                      width: iconSize,
                    ),
                  ),
                ),
              ),
            ),
            EventraNavButtonVariant.regular => Container(
              decoration: BoxDecoration(
                color: colorScheme.primary,
                shape: BoxShape.circle,
                border: hasBorder
                    ? Border.all(color: colorScheme.onPrimary)
                    : null,
              ),
              alignment: Alignment.center,
              child: RotatedBox(
                quarterTurns: isNext ? 0 : 2,
                child: SvgPicture.asset(
                  EventraVectors.angleLeft,
                  colorFilter: ColorFilter.mode(
                    colorScheme.onPrimary,
                    BlendMode.srcIn,
                  ),
                  width: iconSize,
                  height: iconSize,
                ),
              ),
            ),
            EventraNavButtonVariant.clear => Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: hasBorder
                    ? Border.all(color: colorScheme.onPrimary)
                    : null,
              ),
              alignment: Alignment.center,
              child: RotatedBox(
                quarterTurns: isNext ? 0 : 2,
                child: SvgPicture.asset(
                  EventraVectors.angleLeft,
                  colorFilter: ColorFilter.mode(
                    colorScheme.onPrimary,
                    BlendMode.srcIn,
                  ),
                  width: iconSize,
                  height: iconSize,
                ),
              ),
            ),
          },
        ),
      ),
    );
  }
}
