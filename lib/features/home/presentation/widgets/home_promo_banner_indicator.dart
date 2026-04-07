import 'package:flutter/material.dart';

class HomePromoBannerIndicator extends StatelessWidget {
  const HomePromoBannerIndicator({required this.activeIndex, super.key});

  final int activeIndex;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        3,
        (index) => Container(
          width: activeIndex == index ? 18 : 8,
          height: 8,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(999),
            color: activeIndex == index
                ? colorScheme.primary
                : colorScheme.primary.withValues(alpha: 0.3),
          ),
        ),
      ),
    );
  }
}
