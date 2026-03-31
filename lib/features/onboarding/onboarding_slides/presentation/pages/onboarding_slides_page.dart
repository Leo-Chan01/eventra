import 'dart:async';

import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/onboarding/onboarding_slides/domain/models/onboarding_slide.dart';
import 'package:eventra/features/onboarding/onboarding_slides/presentation/bloc/onboarding_slides_bloc.dart';
import 'package:eventra/features/onboarding/onboarding_slides/presentation/widgets/account_selection_bottom_sheet.dart';
import 'package:eventra/features/onboarding/onboarding_slides/presentation/widgets/onboarding_page_indicator.dart';
import 'package:eventra/features/onboarding/onboarding_slides/presentation/widgets/onboarding_slide_widget.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/resources/resources.dart';
import 'package:eventra/shared/widgets/eventra_buttons/eventra_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingSlidesPage extends StatefulWidget {
  const OnboardingSlidesPage({super.key});

  static const String path = '/onboarding-slides';
  static const String name = 'onboarding-slides';

  @override
  State<OnboardingSlidesPage> createState() => _OnboardingSlidesPageState();
}

class _OnboardingSlidesPageState extends State<OnboardingSlidesPage> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final slides = _getSlides(context);

    return BlocProvider(
      create: (context) => OnboardingSlidesBloc(),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: BlocBuilder<OnboardingSlidesBloc, OnboardingSlidesState>(
                  builder: (context, state) {
                    return PageView.builder(
                      controller: _pageController,
                      itemCount: slides.length,
                      onPageChanged: (index) {
                        context.read<OnboardingSlidesBloc>().add(
                          OnboardingSlideChanged(index),
                        );
                      },
                      itemBuilder: (context, index) {
                        return OnboardingSlideWidget(slide: slides[index]);
                      },
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: Column(
                  children: [
                    BlocBuilder<OnboardingSlidesBloc, OnboardingSlidesState>(
                      builder: (context, state) {
                        return OnboardingPageIndicator(
                          itemCount: slides.length,
                          currentIndex: state.currentIndex,
                        );
                      },
                    ),
                    58.vertSpacing,
                    BlocBuilder<OnboardingSlidesBloc, OnboardingSlidesState>(
                      builder: (context, state) {
                        return EventraButton(
                          buttonText: state.isLastSlide
                              ? context.l10n.onboardingButtonGetStarted
                              : context.l10n.onboardingButtonNext,
                          onPressed: () async {
                            if (state.isLastSlide) {
                              await showModalBottomSheet<void>(
                                context: context,
                                backgroundColor: Colors.transparent,
                                isScrollControlled: true,
                                builder: (context) =>
                                    const AccountSelectionBottomSheet(),
                              );
                            } else {
                              unawaited(
                                _pageController.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                ),
                              );
                            }
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<OnboardingSlide> _getSlides(BuildContext context) {
    return [
      OnboardingSlide(
        image: EventraImages.onboardingImage1,
        title: context.l10n.onboardingTitle1,
        description: context.l10n.onboardingDescription1,
      ),
      OnboardingSlide(
        image: EventraImages.onboardingImage2,
        title: context.l10n.onboardingTitle2,
        description: context.l10n.onboardingDescription2,
      ),
      OnboardingSlide(
        image: EventraImages.onboardingImgae3,
        title: context.l10n.onboardingTitle3,
        description: context.l10n.onboardingDescription3,
      ),
    ];
  }
}
