import 'package:eventra/core/utils/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeReelActionItem extends StatelessWidget {
  const HomeReelActionItem({
    required this.icon,
    required this.count,
    this.onTap,
    super.key,
  });

  final String icon;
  final int count;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(999),
      child: Column(
        children: [
          SvgPicture.asset(
            icon,
            height: 30,
            width: 30,
          ),
          6.vertSpacing,
          Text(
            '$count',
            style: 14.w500.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
