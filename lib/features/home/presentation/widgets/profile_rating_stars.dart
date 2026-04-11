import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileRatingStars extends StatelessWidget {
  const ProfileRatingStars({
    required this.rating,
    required this.onRatingSelected,
    super.key,
  });

  final int rating;
  final ValueChanged<int> onRatingSelected;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        final starIndex = index + 1;
        final isSelected = starIndex <= rating;

        return GestureDetector(
          key: Key('profile_rating_star_$starIndex'),
          onTap: () => onRatingSelected(starIndex),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: SvgPicture.asset(
              EventraVectors.starUnfilledRatingIconProfileSettings,
              width: 34,
              height: 34,
              colorFilter: ColorFilter.mode(
                isSelected ? colorScheme.primary : colorScheme.outlineVariant,
                BlendMode.srcIn,
              ),
            ),
          ),
        );
      }),
    );
  }
}
