import 'package:eventra/features/auth/signup/presentation/pages/vendor_kyc_page.dart';
import 'package:eventra/features/auth/signup/presentation/pages/vendor_kyc_business_address_page.dart';
import 'package:eventra/features/auth/signup/presentation/pages/vendor_kyc_cac_page.dart';
import 'package:eventra/features/auth/signup/presentation/pages/vendor_kyc_nin_page.dart';
import 'package:eventra/features/auth/signup/presentation/widgets/vendor_kyc_loading_indicator.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

Widget _buildApp() {
  final router = GoRouter(
    initialLocation: VendorKycPage.path,
    routes: [
      GoRoute(
        path: VendorKycPage.path,
        name: VendorKycPage.name,
        builder: (_, _) => const VendorKycPage(),
      ),
      GoRoute(
        path: VendorKycNinPage.path,
        name: VendorKycNinPage.name,
        builder: (_, _) => const Scaffold(body: Text('vendor-kyc-nin-page')),
      ),
      GoRoute(
        path: VendorKycCacPage.path,
        name: VendorKycCacPage.name,
        builder: (_, _) => const Scaffold(body: Text('vendor-kyc-cac-page')),
      ),
      GoRoute(
        path: VendorKycBusinessAddressPage.path,
        name: VendorKycBusinessAddressPage.name,
        builder: (_, _) =>
            const Scaffold(body: Text('vendor-kyc-business-address-page')),
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
  group('VendorKycPage', () {
    testWidgets('shows kyc title, requirements, and disabled continue button', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(1170, 2532);
      tester.view.devicePixelRatio = 3;
      addTearDown(tester.view.reset);

      await tester.pumpWidget(_buildApp());
      await tester.pumpAndSettle();

      expect(find.text('Complete your kyc'), findsOneWidget);
      expect(
        find.text(
          'Please fill the from below to make it easier for us to know you.',
        ),
        findsOneWidget,
      );
      expect(find.text('NIN'), findsOneWidget);
      expect(find.text('Facial Verification'), findsOneWidget);
      expect(find.text('C.A.C Certificate'), findsOneWidget);
      expect(find.text('Prof of Business Address'), findsOneWidget);
      expect(find.text('Gov. issued ID'), findsOneWidget);

      final continueButton = tester.widget<ElevatedButton>(
        find
            .descendant(
              of: find.byType(VendorKycPage),
              matching: find.byType(ElevatedButton),
            )
            .first,
      );
      expect(continueButton.onPressed, isNull);
    });

    testWidgets('shows custom loader on tile tap while waiting', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(1170, 2532);
      tester.view.devicePixelRatio = 3;
      addTearDown(tester.view.reset);

      await tester.pumpWidget(_buildApp());
      await tester.pumpAndSettle();

      expect(find.byType(VendorKycLoadingIndicator), findsNothing);

      await tester.tap(find.text('NIN'));
      await tester.pump();

      expect(find.byType(VendorKycLoadingIndicator), findsOneWidget);

      await tester.pump(const Duration(milliseconds: 500));
      expect(find.byType(VendorKycLoadingIndicator), findsOneWidget);

      await tester.pump(const Duration(milliseconds: 1000));
      await tester.pumpAndSettle();
      expect(find.byType(VendorKycLoadingIndicator), findsNothing);
    });

    testWidgets('navigates to nin page after loading simulation', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(1170, 2532);
      tester.view.devicePixelRatio = 3;
      addTearDown(tester.view.reset);

      await tester.pumpWidget(_buildApp());
      await tester.pumpAndSettle();

      await tester.tap(find.text('NIN'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 1500));
      await tester.pumpAndSettle();

      expect(find.text('vendor-kyc-nin-page'), findsOneWidget);
      expect(find.byType(VendorKycLoadingIndicator), findsNothing);
    });

    testWidgets('navigates to cac page after loading simulation', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(1170, 2532);
      tester.view.devicePixelRatio = 3;
      addTearDown(tester.view.reset);

      await tester.pumpWidget(_buildApp());
      await tester.pumpAndSettle();

      await tester.tap(find.text('C.A.C Certificate'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 1500));
      await tester.pumpAndSettle();

      expect(find.text('vendor-kyc-cac-page'), findsOneWidget);
      expect(find.byType(VendorKycLoadingIndicator), findsNothing);
    });

    testWidgets(
      'navigates to business address page after loading simulation',
      (tester) async {
        tester.view.physicalSize = const Size(1170, 2532);
        tester.view.devicePixelRatio = 3;
        addTearDown(tester.view.reset);

        await tester.pumpWidget(_buildApp());
        await tester.pumpAndSettle();

        await tester.tap(find.text('Prof of Business Address'));
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 1500));
        await tester.pumpAndSettle();

        expect(find.text('vendor-kyc-business-address-page'), findsOneWidget);
        expect(find.byType(VendorKycLoadingIndicator), findsNothing);
      },
    );
  });
}
