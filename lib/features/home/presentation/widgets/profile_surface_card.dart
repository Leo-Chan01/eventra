import 'package:eventra/core/utils/boxshadow_util.dart';
import 'package:flutter/material.dart';

class ProfileSurfaceCard extends StatelessWidget {
  const ProfileSurfaceCard({
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.backgroundColor,
    super.key,
  });

  final Widget child;
  final EdgeInsets padding;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor ?? colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(24),
        boxShadow: boxShadowLight,
      ),
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }
}
