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
  // late Animation<double> _scaleAnimation;
  // late Animation<double> _rollRotationAnimation;
  // late Animation<double> _textFadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    );

    // _scaleAnimation =
    //     TweenSequence<double>([
    //       TweenSequenceItem(
    //         tween: Tween<double>(begin: 1, end: 1.5).chain(
    //           CurveTween(curve: Curves.easeOut),
    //         ),
    //         weight: 20,
    //       ),
    //       TweenSequenceItem(
    //         tween: Tween<double>(begin: 1.5, end: 1).chain(
    //           CurveTween(curve: Curves.easeIn),
    //         ),
    //         weight: 20,
    //       ),
    //     ]).animate(
    //       CurvedAnimation(
    //         parent: _controller,
    //         curve: const Interval(0, 0.4),
    //       ),
    //     );

    // _rollRotationAnimation = Tween<double>(begin: 0, end: -2 * 3.14159).animate(
    //   CurvedAnimation(
    //     parent: _controller,
    //     curve: const Interval(0.4, 0.8, curve: Curves.easeInOut),
    //   ),
    // );

    // _textFadeAnimation = Tween<double>(begin: 0, end: 1).animate(
    //   CurvedAnimation(
    //     parent: _controller,
    //     curve: const Interval(0.6, 1, curve: Curves.easeIn),
    //   ),
    // );

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
          // child: FittedBox(
          //   fit: BoxFit.scaleDown,
          //   child: Row(
          //     mainAxisSize: MainAxisSize.min,
          //     children: [
          //       // Icon with Scale and Rotation
          //       // The expansion of the text to the right naturally rolls the
          //       // icon to the left due to Row centering in the Center widget.
          //       Transform.rotate(
          //         angle: _rollRotationAnimation.value,
          //         child: Transform.scale(
          //           scale: _scaleAnimation.value,
          //           child: Image.asset(
          //             EventraImages.logoIconSmall,
          //             width: 80,
          //             height: 80,
          //           ),
          //         ),
          //       ),

          //       // Animated Reveal of Text
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
