part of 'onboarding_slides_bloc.dart';

sealed class OnboardingSlidesEvent {
  const OnboardingSlidesEvent();
}

class OnboardingSlideChanged extends OnboardingSlidesEvent {
  const OnboardingSlideChanged(this.index);
  final int index;
}

class OnboardingNextPressed extends OnboardingSlidesEvent {
  const OnboardingNextPressed();
}
