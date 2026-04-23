import 'package:eventra/features/auth/signup/presentation/bloc/signup_bloc.dart';
import 'package:eventra/features/auth/signup/presentation/bloc/signup_event.dart';
import 'package:eventra/features/auth/signup/presentation/pages/terms_and_conditions_page.dart';
import 'package:eventra/features/auth/signup/presentation/pages/vendor_category_selection_page.dart';
import 'package:eventra/features/auth/signup/presentation/widgets/signup_flow_app_bar.dart';
import 'package:eventra/features/auth/signup/presentation/widgets/vendor_category_option_chip.dart';
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
        path: VendorCategorySelectionPage.path,
        name: VendorCategorySelectionPage.name,
        builder: (_, _) => BlocProvider.value(
          value: bloc,
          child: const VendorCategorySelectionPage(),
        ),
      ),
      GoRoute(
        path: TermsAndConditionsPage.path,
        name: TermsAndConditionsPage.name,
        builder: (_, _) => const Scaffold(body: Text('terms-page')),
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
  group('VendorCategorySelectionPage', () {
    testWidgets('shows 3/4 progress for vendor flow', (tester) async {
      final bloc = SignupBloc()..add(const SignupStarted(AccountType.vendor));
      addTearDown(bloc.close);

      await tester.pumpWidget(
        _buildApp(
          bloc: bloc,
          initialLocation: VendorCategorySelectionPage.path,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(SignupFlowAppBar), findsOneWidget);
      expect(find.text('3/4'), findsOneWidget);
      expect(find.text('Select your Category'), findsOneWidget);
    });

    testWidgets('selected category chip toggles selected state and continues', (
      tester,
    ) async {
      final bloc = SignupBloc()..add(const SignupStarted(AccountType.vendor));
      addTearDown(bloc.close);

      await tester.pumpWidget(
        _buildApp(
          bloc: bloc,
          initialLocation: VendorCategorySelectionPage.path,
        ),
      );
      await tester.pumpAndSettle();

      final eventPlannerChip = find.widgetWithText(
        VendorCategoryOptionChip,
        'Event Planner',
      );
      expect(eventPlannerChip, findsOneWidget);

      await tester.tap(eventPlannerChip);
      await tester.pumpAndSettle();

      expect(
        tester.widget<VendorCategoryOptionChip>(eventPlannerChip).isSelected,
        isTrue,
      );

      await tester.ensureVisible(find.text('Continue'));
      await tester.tap(find.text('Continue'));
      await tester.pumpAndSettle();

      expect(find.text('terms-page'), findsOneWidget);
    });
  });
}
