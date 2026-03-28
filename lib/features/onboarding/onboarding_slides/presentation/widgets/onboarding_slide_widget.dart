import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/onboarding/onboarding_slides/domain/models/onboarding_slide.dart';
import 'package:flutter/material.dart';

class OnboardingSlideWidget extends StatelessWidget {
  const OnboardingSlideWidget({
    required this.slide,
    super.key,
  });

  final OnboardingSlide slide;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 4,
          child: Image.asset(
            slide.image,
            fit: BoxFit.contain,
          ),
        ),

        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Text(
                  slide.title,
                  textAlign: TextAlign.center,
                  style: 24.bold.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                16.vertSpacing,
                Text(
                  slide.description,
                  textAlign: TextAlign.center,
                  style: 16.w400.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
