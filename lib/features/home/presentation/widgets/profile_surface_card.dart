import 'package:eventra/core/utils/boxshadow_util.dart';
import 'package:flutter/material.dart';

class ProfileSurfaceCard extends StatelessWidget {
  const ProfileSurfaceCard({
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.backgroundColor,
    this.borderColor,
    this.isolatedIcon = false,
    super.key,
  });

  const ProfileSurfaceCard.isolatedIcon({
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.backgroundColor,
    this.borderColor,
    this.isolatedIcon = true,
    super.key,
  });

  final Widget child;
  final EdgeInsets padding;
  final Color? backgroundColor;
  final Color? borderColor;
  final bool isolatedIcon;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    if (isolatedIcon) {
      return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: backgroundColor ?? colorScheme.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(24),
          boxShadow: boxShadowLight,
          border: borderColor != null
              ? Border.all(color: borderColor!, width: 1.5)
              : null,
        ),
        child: Padding(
          padding: padding,
          child: child,
        ),
      );
    }

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor ?? colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(24),
        boxShadow: boxShadowLight,
        border: borderColor != null
            ? Border.all(color: borderColor!, width: 1.5)
            : null,
      ),
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }
}
