import 'package:eventra/features/auth/signup/presentation/bloc/signup_bloc.dart';
import 'package:eventra/features/auth/signup/presentation/bloc/signup_event.dart';
import 'package:eventra/features/auth/signup/presentation/pages/vendor_business_details_page.dart';
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
        path: VendorBusinessDetailsPage.path,
        name: VendorBusinessDetailsPage.name,
        builder: (_, _) => BlocProvider.value(
          value: bloc,
          child: const VendorBusinessDetailsPage(),
        ),
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
  group('VendorBusinessDetailsPage', () {
    testWidgets('shows 4/4 progress and business form fields', (tester) async {
      final bloc = SignupBloc()..add(const SignupStarted(AccountType.vendor));
      addTearDown(bloc.close);

      await tester.pumpWidget(
        _buildApp(
          bloc: bloc,
          initialLocation: VendorBusinessDetailsPage.path,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(SignupFlowAppBar), findsOneWidget);
      expect(find.text('4/4'), findsOneWidget);
      expect(find.text('Tell us about your Business'), findsOneWidget);
      expect(find.text('Business Name'), findsOneWidget);
      expect(find.text('Business Address'), findsOneWidget);
      expect(find.text('Business Description'), findsOneWidget);
      expect(find.text('Upload Business Logo (Optional)'), findsOneWidget);
      expect(find.text('Upload cover photo (Optional)'), findsOneWidget);
    });

    testWidgets('continue routes to welcome page', (tester) async {
      final bloc = SignupBloc()..add(const SignupStarted(AccountType.vendor));
      addTearDown(bloc.close);

      await tester.pumpWidget(
        _buildApp(
          bloc: bloc,
          initialLocation: VendorBusinessDetailsPage.path,
        ),
      );
      await tester.pumpAndSettle();

      await tester.ensureVisible(find.text('Continue'));
      await tester.tap(find.text('Continue'));
      await tester.pumpAndSettle();

      expect(find.text('welcome-page'), findsOneWidget);
    });

    testWidgets('tapping address field opens location lookup sheet', (
      tester,
    ) async {
      final bloc = SignupBloc()..add(const SignupStarted(AccountType.vendor));
      addTearDown(bloc.close);

      await tester.pumpWidget(
        _buildApp(
          bloc: bloc,
          initialLocation: VendorBusinessDetailsPage.path,
        ),
      );
      await tester.pumpAndSettle();

      await tester.ensureVisible(find.text('Enter Address'));
      await tester.tap(find.text('Enter Address'), warnIfMissed: false);
      await tester.pumpAndSettle();

      expect(find.text('Your current address'), findsOneWidget);
      expect(
        find.byKey(const Key('home_location_search_input')),
        findsOneWidget,
      );
    });
  });
}
