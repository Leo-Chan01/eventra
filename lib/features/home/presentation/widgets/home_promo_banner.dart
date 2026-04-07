import 'dart:async';

import 'package:eventra/features/home/presentation/widgets/home_promo_banner_image.dart';
import 'package:eventra/features/home/presentation/widgets/home_promo_banner_indicator.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';

class HomePromoBanner extends StatefulWidget {
  const HomePromoBanner({super.key});

  @override
  State<HomePromoBanner> createState() => _HomePromoBannerState();
}

class _HomePromoBannerState extends State<HomePromoBanner> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      if (_pageController.hasClients) {
        unawaited(
          _pageController.animateToPage(
            _currentPage,
            duration: const Duration(milliseconds: 350),
            curve: Curves.easeIn,
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 160,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: 3,
            itemBuilder: (context, index) {
              return HomePromoBannerImage(
                imagePath: index == 1
                    ? EventraImages.onboardingImage2
                    : EventraImages.onboardingImage1,
              );
            },
          ),
        ),
        const SizedBox(height: 12),
        HomePromoBannerIndicator(activeIndex: _currentPage),
      ],
    );
  }
}
