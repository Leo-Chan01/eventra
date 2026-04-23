import 'package:eventra/features/auth/signup/presentation/bloc/signup_bloc.dart';
import 'package:eventra/features/auth/signup/presentation/bloc/signup_event.dart';
import 'package:eventra/features/auth/signup/presentation/pages/personal_details_page.dart';
import 'package:eventra/features/auth/signup/presentation/pages/terms_and_conditions_page.dart';
import 'package:eventra/features/auth/signup/presentation/pages/welcome_success_page.dart';
import 'package:eventra/features/auth/signup/presentation/widgets/signup_flow_app_bar.dart';
import 'package:eventra/features/onboarding/onboarding_slides/domain/models/account_type.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

Widget _buildApp({required SignupBloc bloc, required String initialLocation}) {
  final router = GoRouter(
    initialLocation: initialLocation,
    routes: [
      GoRoute(
        path: PersonalDetailsPage.path,
        name: PersonalDetailsPage.name,
        builder: (_, _) => BlocProvider.value(
          value: bloc,
          child: const PersonalDetailsPage(),
        ),
      ),
      GoRoute(
        path: TermsAndConditionsPage.path,
        name: TermsAndConditionsPage.name,
        builder: (_, _) => const Scaffold(body: Text('terms-page')),
      ),
      GoRoute(
        path: WelcomeSuccessPage.path,
        name: WelcomeSuccessPage.name,
        builder: (_, _) => const Scaffold(body: Text('welcome-page')),
      ),
    ],
  );

  return ScreenUtilInit(
    designSize: const Size(375, 812),
    minTextAdapt: true,
    builder: (_, _) => MaterialApp.router(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: router,
    ),
  );
}

void main() {
  group('PersonalDetailsPage vendor flow', () {
    testWidgets('shows 2/4 appbar progress for vendor', (tester) async {
      final bloc = SignupBloc()..add(const SignupStarted(AccountType.vendor));
      addTearDown(bloc.close);

      await tester.pumpWidget(
        _buildApp(bloc: bloc, initialLocation: PersonalDetailsPage.path),
      );
      await tester.pumpAndSettle();

      expect(find.byType(SignupFlowAppBar), findsOneWidget);
      expect(find.text('2/4'), findsOneWidget);
      expect(find.text('Phone number'), findsNothing);
      expect(find.text('Referral code (Optional)'), findsOneWidget);
    });

    testWidgets('continue routes vendor to next step', (tester) async {
      final bloc = SignupBloc()..add(const SignupStarted(AccountType.vendor));
      addTearDown(bloc.close);

      await tester.pumpWidget(
        _buildApp(bloc: bloc, initialLocation: PersonalDetailsPage.path),
      );
      await tester.pumpAndSettle();

      await tester.ensureVisible(find.text('Sign Up'));
      await tester.tap(find.text('Sign Up'));
      await tester.pumpAndSettle();

      expect(find.text('terms-page'), findsOneWidget);
    });
  });

  group('PersonalDetailsPage client flow', () {
    testWidgets('hides progress and routes to welcome', (tester) async {
      final bloc = SignupBloc()..add(const SignupStarted(AccountType.client));
      addTearDown(bloc.close);

      await tester.pumpWidget(
        _buildApp(bloc: bloc, initialLocation: PersonalDetailsPage.path),
      );
      await tester.pumpAndSettle();

      expect(find.text('2/4'), findsNothing);
      expect(find.text('Phone number'), findsOneWidget);

      await tester.ensureVisible(find.text('Continue'));
      await tester.tap(find.text('Continue'));
      await tester.pumpAndSettle();

      expect(find.text('welcome-page'), findsOneWidget);
    });
  });
}
