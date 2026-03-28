part of 'onboarding_slides_bloc.dart';

class OnboardingSlidesState {
  const OnboardingSlidesState({
    required this.currentIndex,
    required this.isLastSlide,
  });

  factory OnboardingSlidesState.initial() => const OnboardingSlidesState(
    currentIndex: 0,
    isLastSlide: false,
  );

  final int currentIndex;
  final bool isLastSlide;

  OnboardingSlidesState copyWith({
    int? currentIndex,
    bool? isLastSlide,
  }) {
    return OnboardingSlidesState(
      currentIndex: currentIndex ?? this.currentIndex,
      isLastSlide: isLastSlide ?? this.isLastSlide,
    );
  }
}
