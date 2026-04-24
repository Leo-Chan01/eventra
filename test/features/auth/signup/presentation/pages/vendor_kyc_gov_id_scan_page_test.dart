import 'package:eventra/features/auth/signup/presentation/pages/vendor_kyc_gov_id_preview_page.dart';
import 'package:eventra/features/auth/signup/presentation/pages/vendor_kyc_gov_id_scan_page.dart';
import 'package:eventra/features/auth/signup/presentation/widgets/vendor_gov_id_scan_corner.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

Widget _buildApp() {
  final router = GoRouter(
    initialLocation: VendorKycGovIdScanPage.path,
    routes: [
      GoRoute(
        path: VendorKycGovIdScanPage.path,
        name: VendorKycGovIdScanPage.name,
        builder: (_, _) => const VendorKycGovIdScanPage(),
      ),
      GoRoute(
        path: VendorKycGovIdPreviewPage.path,
        name: VendorKycGovIdPreviewPage.name,
        builder: (_, _) =>
            const Scaffold(body: Text('vendor-kyc-gov-id-preview')),
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
  group('VendorKycGovIdScanPage', () {
    testWidgets('shows scan screen content', (tester) async {
      tester.view.physicalSize = const Size(1170, 2532);
      tester.view.devicePixelRatio = 3;
      addTearDown(tester.view.reset);

      await tester.pumpWidget(_buildApp());
      await tester.pumpAndSettle();

      expect(find.text('Front of your ID Card'), findsOneWidget);
      expect(find.text('Place Properly'), findsOneWidget);
      expect(find.text('Scan'), findsOneWidget);
      expect(find.text('Upload'), findsOneWidget);
      expect(find.byType(VendorGovIdScanCorner), findsNWidgets(4));
    });

    testWidgets('scan action navigates to preview page', (tester) async {
      tester.view.physicalSize = const Size(1170, 2532);
      tester.view.devicePixelRatio = 3;
      addTearDown(tester.view.reset);

      await tester.pumpWidget(_buildApp());
      await tester.pumpAndSettle();

      await tester.tap(find.text('Scan'));
      await tester.pumpAndSettle();

      expect(find.text('vendor-kyc-gov-id-preview'), findsOneWidget);
    });
  });
}
