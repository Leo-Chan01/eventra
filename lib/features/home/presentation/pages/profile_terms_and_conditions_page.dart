import 'package:eventra/features/auth/signup/presentation/pages/terms_and_conditions_page.dart';
import 'package:flutter/material.dart';

class ProfileTermsAndConditionsPage extends StatelessWidget {
  const ProfileTermsAndConditionsPage({super.key});

  static const String path = '/profile-terms-and-conditions';
  static const String name = 'profile-terms-and-conditions';

  @override
  Widget build(BuildContext context) {
    return const TermsAndConditionsPage();
  }
}
