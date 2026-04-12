import 'package:flutter/material.dart';

class ReviewStarSelector extends StatelessWidget {
  const ReviewStarSelector({
    required this.rating,
    required this.onRatingChanged,
    super.key,
  });

  final int rating;
  final ValueChanged<int> onRatingChanged;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        final isSelected = index < rating;
        return IconButton(
          onPressed: () => onRatingChanged(index + 1),
          iconSize: 44,
          splashRadius: 24,
          icon: Icon(
            Icons.star_rounded,
            color: isSelected
                ? colorScheme.primary
                : colorScheme.outline.withValues(alpha: 0.65),
          ),
        );
      }),
    );
  }
}
