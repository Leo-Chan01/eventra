import 'dart:async';
import 'package:eventra/core/utils/lottie_decorder.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OnboardingLoadingLogo extends StatefulWidget {
  const OnboardingLoadingLogo({
    required this.onAnimationComplete,
    super.key,
  });

  final VoidCallback onAnimationComplete;

  @override
  State<OnboardingLoadingLogo> createState() => _OnboardingLoadingLogoState();
}

class _OnboardingLoadingLogoState extends State<OnboardingLoadingLogo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.onAnimationComplete();
      }
    });

    unawaited(_controller.forward());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Center(
          child: Lottie.asset(
            EventraAnims.splash,
            decoder: customDecoder,
            repeat: false,
          ),

          //       SizeTransition(
          //         sizeFactor: CurvedAnimation(
          //           parent: _controller,
          //           curve: const Interval(0.4, 0.8, curve: Curves.easeInOut),
          //         ),
          //         axis: Axis.horizontal,
          //         axisAlignment: -1,
          //         child: Opacity(
          //           opacity: _textFadeAnimation.value,
          //           child: Padding(
          //             padding: const EdgeInsets.only(left: 12),
          //             child: Theme.of(context).brightness == Brightness.dark
          //                 ? SvgPicture.asset(
          //                     EventraVectors.eventraPrimaryText,
          //                     height: 40,
          //                   )
          //                 : SvgPicture.asset(
          //                     EventraVectors.eventraBlackText,
          //                     height: 40,
          //                   ),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        );
      },
    );
  }
}
