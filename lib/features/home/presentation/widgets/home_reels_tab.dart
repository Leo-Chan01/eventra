import 'dart:async';

import 'package:eventra/features/home/domain/models/home_reel.dart';
import 'package:eventra/features/home/presentation/widgets/home_reel_card.dart';
import 'package:flutter/material.dart';

class HomeReelsTab extends StatefulWidget {
  const HomeReelsTab({
    required this.reels,
    required this.onShareReel,
    required this.onExit,
    required this.isVendorExperience,
    super.key,
  });

  final List<HomeReel> reels;
  final ValueChanged<HomeReel> onShareReel;
  final VoidCallback onExit;
  final bool isVendorExperience;

  @override
  State<HomeReelsTab> createState() => HomeReelsTabState();
}

class HomeReelsTabState extends State<HomeReelsTab> {
  late final PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      key: const Key('home_reels_feed'),
      controller: _pageController,
      scrollDirection: widget.isVendorExperience
          ? Axis.horizontal
          : Axis.vertical,
      itemCount: widget.reels.length,
      onPageChanged: (index) {
        if (_currentIndex != index) {
          setState(() => _currentIndex = index);
        }
      },
      itemBuilder: (context, index) {
        final reel = widget.reels[index];
        return HomeReelCard(
          reel: reel,
          onShare: () => widget.onShareReel(reel),
          isVendorExperience: widget.isVendorExperience,
          onBack: widget.onExit,
          hasPrevious: index > 0,
          hasNext: index < widget.reels.length - 1,
          onPrevious: () => _goToIndex(index - 1),
          onNext: () => _goToIndex(index + 1),
        );
      },
    );
  }

  void _goToIndex(int nextIndex) {
    if (nextIndex < 0 || nextIndex >= widget.reels.length) {
      return;
    }
    if (_currentIndex == nextIndex) {
      return;
    }

    unawaited(
      _pageController.animateToPage(
        nextIndex,
        duration: const Duration(milliseconds: 260),
        curve: Curves.easeOut,
      ),
    );
  }
}
