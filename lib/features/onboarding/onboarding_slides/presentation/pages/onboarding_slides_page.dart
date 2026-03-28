import 'package:flutter/material.dart';

class OnboardingSlidesPage extends StatelessWidget {
  const OnboardingSlidesPage({super.key});

  static const String path = '/onboarding-slides';
  static const String name = 'onboarding-slides';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Onboarding Slides'),
      ),
      body: const Center(
        child: Text('Welcome to Onboarding!'),
      ),
    );
  }
}
