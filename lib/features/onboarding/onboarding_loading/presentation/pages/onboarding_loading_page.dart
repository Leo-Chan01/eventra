import 'package:eventra/features/onboarding/onboarding_loading/presentation/bloc/onboarding_loading_bloc.dart';
import 'package:eventra/features/onboarding/onboarding_loading/presentation/widgets/onboarding_loading_logo.dart';
import 'package:eventra/features/onboarding/onboarding_slides/presentation/pages/onboarding_slides_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class OnboardingLoadingPage extends StatelessWidget {
  const OnboardingLoadingPage({super.key});

  static const String path = '/onboarding-loading';
  static const String name = 'onboarding-loading';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          OnboardingLoadingBloc()..add(OnboardingLoadingStarted()),
      child: const OnboardingLoadingView(),
    );
  }
}

class OnboardingLoadingView extends StatelessWidget {
  const OnboardingLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<OnboardingLoadingBloc, OnboardingLoadingState>(
      listener: (context, state) {
        if (state is OnboardingLoadingSuccess) {
          context.go(OnboardingSlidesPage.path);
        }
      },
      child: Scaffold(
        // backgroundColor: Theme.of(context).colorScheme.surface,
        backgroundColor: Colors.white,
        body: Center(
          // child: Lottie.asset(
          //   EventraAnims.splash,
          //   decoder: customDecoder,
          //   repeat: false
          // ),
          child: OnboardingLoadingLogo(
            onAnimationComplete: () {
              context.read<OnboardingLoadingBloc>().add(
                OnboardingLoadingAnimationCompleted(),
              );
            },
          ),
        ),
      ),
    );
  }
}
