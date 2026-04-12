import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VendorRatingStars extends StatelessWidget {
  const VendorRatingStars({
    required this.stars,
    required this.starSize,
    super.key,
  });

  final double stars;
  final double starSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (index) {
        if (index < stars.floor()) {
          return Padding(
            padding: const EdgeInsets.only(right: 2),
            child: SvgPicture.asset(
              EventraVectors.starVector,
              width: starSize,
              height: starSize,
            ),
          );
        } else if (index < stars) {
          return Padding(
            padding: const EdgeInsets.only(right: 2),
            child: SvgPicture.asset(
              EventraVectors.starUnfilledRatingIconProfileSettings,
              width: starSize,
              height: starSize,
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.only(right: 2),
            child: SvgPicture.asset(
              EventraVectors.starUnfilledRatingIconProfileSettings,
              width: starSize,
              height: starSize,
            ),
          );
        }
      }),
    );
  }
}
