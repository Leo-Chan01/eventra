import 'package:eventra/features/auth/signup/presentation/pages/signup_page.dart';
import 'package:eventra/features/onboarding/onboarding_loading/presentation/pages/onboarding_loading_page.dart';
import 'package:eventra/features/onboarding/onboarding_slides/domain/models/account_type.dart';
import 'package:eventra/features/onboarding/onboarding_slides/presentation/pages/onboarding_slides_page.dart';
import 'package:eventra/playground/widget_canvas.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter._();

  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: OnboardingLoadingPage.path,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: WidgetCanvas.path,
        name: WidgetCanvas.name,
        builder: (context, state) => const WidgetCanvas(),
      ),
      GoRoute(
        path: OnboardingLoadingPage.path,
        name: OnboardingLoadingPage.name,
        builder: (context, state) => const OnboardingLoadingPage(),
      ),
      GoRoute(
        path: OnboardingSlidesPage.path,
        name: OnboardingSlidesPage.name,
        builder: (context, state) => const OnboardingSlidesPage(),
      ),
      GoRoute(
        path: SignupPage.path,
        name: SignupPage.name,
        builder: (context, state) {
          final accountType = state.extra as AccountType;
          return SignupPage(accountType: accountType);
        },
      ),
    ],
  );
}
