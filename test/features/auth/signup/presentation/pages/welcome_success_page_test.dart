import 'package:eventra/features/auth/signup/presentation/bloc/signup_bloc.dart';
import 'package:eventra/features/auth/signup/presentation/bloc/signup_event.dart';
import 'package:eventra/features/auth/signup/presentation/pages/vendor_kyc_page.dart';
import 'package:eventra/features/auth/signup/presentation/pages/welcome_success_page.dart';
import 'package:eventra/features/home/presentation/pages/home_page.dart';
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
        path: WelcomeSuccessPage.path,
        name: WelcomeSuccessPage.name,
        builder: (_, _) => BlocProvider.value(
          value: bloc,
          child: const WelcomeSuccessPage(),
        ),
      ),
      GoRoute(
        path: HomePage.path,
        name: HomePage.name,
        builder: (_, _) => const Scaffold(body: Text('home-page')),
      ),
      GoRoute(
        path: VendorKycPage.path,
        name: VendorKycPage.name,
        builder: (_, _) => const Scaffold(body: Text('vendor-kyc-page')),
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
  group('WelcomeSuccessPage', () {
    testWidgets('shows vendor buttons for vendor account type', (tester) async {
      tester.view.physicalSize = const Size(1170, 2532);
      tester.view.devicePixelRatio = 3;
      addTearDown(tester.view.reset);

      final bloc = SignupBloc()..add(const SignupStarted(AccountType.vendor));
      addTearDown(bloc.close);

      await tester.pumpWidget(
        _buildApp(
          bloc: bloc,
          initialLocation: WelcomeSuccessPage.path,
        ),
      );
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 400));

      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Continue KYC'), findsOneWidget);
    });

    testWidgets('continue kyc routes to vendor kyc page for vendor', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(1170, 2532);
      tester.view.devicePixelRatio = 3;
      addTearDown(tester.view.reset);

      final bloc = SignupBloc()..add(const SignupStarted(AccountType.vendor));
      addTearDown(bloc.close);

      await tester.pumpWidget(
        _buildApp(
          bloc: bloc,
          initialLocation: WelcomeSuccessPage.path,
        ),
      );
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 400));

      await tester.tap(find.text('Continue KYC'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.text('vendor-kyc-page'), findsOneWidget);
    });

    testWidgets('hides continue kyc button for client account type', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(1170, 2532);
      tester.view.devicePixelRatio = 3;
      addTearDown(tester.view.reset);

      final bloc = SignupBloc()..add(const SignupStarted(AccountType.client));
      addTearDown(bloc.close);

      await tester.pumpWidget(
        _buildApp(
          bloc: bloc,
          initialLocation: WelcomeSuccessPage.path,
        ),
      );
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 400));

      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Continue KYC'), findsNothing);
    });
  });
}
