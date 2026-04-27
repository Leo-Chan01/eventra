import 'package:eventra/core/utils/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeReelStatItem extends StatelessWidget {
  const HomeReelStatItem({
    required this.iconPath,
    required this.count,
    this.onTap,
    super.key,
  });

  final String iconPath;
  final int count;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                iconPath,
                width: 28,
                height: 28,
                colorFilter: ColorFilter.mode(
                  colorScheme.onPrimary,
                  BlendMode.srcIn,
                ),
              ),
              8.vertSpacing,
              Text(
                '$count',
                style: 14.w400.copyWith(color: colorScheme.onPrimary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
