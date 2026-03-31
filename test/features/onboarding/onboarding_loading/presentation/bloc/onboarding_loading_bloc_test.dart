import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:eventra/features/onboarding/onboarding_loading/presentation/bloc/onboarding_loading_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('OnboardingLoadingBloc', () {
    late OnboardingLoadingBloc onboardingLoadingBloc;

    setUp(() {
      onboardingLoadingBloc = OnboardingLoadingBloc();
    });

    tearDown(() {
      unawaited(onboardingLoadingBloc.close());
    });

    test('initial state is OnboardingLoadingInitial', () {
      expect(onboardingLoadingBloc.state, OnboardingLoadingInitial());
    });

    blocTest<OnboardingLoadingBloc, OnboardingLoadingState>(
      'emits [OnboardingLoadingInProgress, '
      'OnboardingLoadingWaitingForAnimation] '
      'when OnboardingLoadingStarted is added and animation is not yet done',
      build: () => onboardingLoadingBloc,
      act: (bloc) => bloc.add(OnboardingLoadingStarted()),
      wait: const Duration(milliseconds: 1600), // Account for simulated delay
      expect: () => [
        OnboardingLoadingInProgress(),
        OnboardingLoadingWaitingForAnimation(),
      ],
    );

    blocTest<OnboardingLoadingBloc, OnboardingLoadingState>(
      'emits [OnboardingLoadingSuccess] '
      'when both OnboardingLoadingStarted and '
      'OnboardingLoadingAnimationCompleted are done',
      build: () => onboardingLoadingBloc,
      act: (bloc) async {
        bloc.add(OnboardingLoadingStarted());
        await Future<void>.delayed(const Duration(milliseconds: 1600));
        bloc.add(OnboardingLoadingAnimationCompleted());
      },
      expect: () => [
        OnboardingLoadingInProgress(),
        OnboardingLoadingWaitingForAnimation(),
        OnboardingLoadingSuccess(),
      ],
    );

    blocTest<OnboardingLoadingBloc, OnboardingLoadingState>(
      'emits [OnboardingLoadingSuccess] '
      'when animation completes before initialization finishes',
      build: () => onboardingLoadingBloc,
      act: (bloc) async {
        bloc
          ..add(OnboardingLoadingAnimationCompleted())
          ..add(OnboardingLoadingStarted());
      },
      wait: const Duration(milliseconds: 1600),
      expect: () => [
        OnboardingLoadingInProgress(),
        OnboardingLoadingSuccess(),
      ],
    );
  });
}
