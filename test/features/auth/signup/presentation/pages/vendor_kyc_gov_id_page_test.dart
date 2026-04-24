import 'package:eventra/features/auth/signup/presentation/pages/vendor_kyc_gov_id_page.dart';
import 'package:eventra/features/auth/signup/presentation/pages/vendor_kyc_gov_id_scan_page.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

Widget _buildApp() {
  final router = GoRouter(
    initialLocation: VendorKycGovIdPage.path,
    routes: [
      GoRoute(
        path: VendorKycGovIdPage.path,
        name: VendorKycGovIdPage.name,
        builder: (_, _) => const VendorKycGovIdPage(),
      ),
      GoRoute(
        path: VendorKycGovIdScanPage.path,
        name: VendorKycGovIdScanPage.name,
        builder: (_, _) => const Scaffold(body: Text('vendor-kyc-gov-id-scan')),
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
  group('VendorKycGovIdPage', () {
    testWidgets('shows document type list and disabled continue initially', (
      tester,
    ) async {
      await tester.pumpWidget(_buildApp());
      await tester.pumpAndSettle();

      expect(find.text('Choose a document type'), findsOneWidget);
      expect(find.text('NIN'), findsOneWidget);
      expect(find.text('Drivers License'), findsOneWidget);
      expect(find.text('Passport'), findsOneWidget);
      expect(find.text('Voter’s ID'), findsOneWidget);

      final continueButton = tester.widget<ElevatedButton>(
        find
            .descendant(
              of: find.byType(VendorKycGovIdPage),
              matching: find.byType(ElevatedButton),
            )
            .first,
      );
      expect(continueButton.onPressed, isNull);
    });

    testWidgets('enables continue after selecting a type and navigates', (
      tester,
    ) async {
      await tester.pumpWidget(_buildApp());
      await tester.pumpAndSettle();

      await tester.tap(find.text('Passport'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Continue'));
      await tester.pumpAndSettle();

      expect(find.text('vendor-kyc-gov-id-scan'), findsOneWidget);
    });
  });
}
