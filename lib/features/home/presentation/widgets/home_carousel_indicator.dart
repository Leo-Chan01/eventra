import 'package:flutter/material.dart';

class HomeCarouselIndicator extends StatelessWidget {
  const HomeCarouselIndicator({
    required this.activeIndex,
    required this.count,
    super.key,
  });

  final int activeIndex;
  final int count;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        count,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          width: activeIndex == index ? 22 : 8,
          height: 8,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(999),
            color: activeIndex == index
                ? colorScheme.primary
                : colorScheme.onSurface.withValues(alpha: 0.25),
          ),
        ),
      ),
    );
  }
}
