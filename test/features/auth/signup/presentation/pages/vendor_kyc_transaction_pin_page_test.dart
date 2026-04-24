import 'package:eventra/features/auth/signup/presentation/pages/vendor_kyc_transaction_pin_page.dart';
import 'package:eventra/features/auth/signup/presentation/pages/vendor_kyc_under_review_page.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

Widget buildApp() {
  final router = GoRouter(
    initialLocation: VendorKycTransactionPinPage.path,
    routes: [
      GoRoute(
        path: VendorKycTransactionPinPage.path,
        name: VendorKycTransactionPinPage.name,
        builder: (_, _) => const VendorKycTransactionPinPage(),
      ),
      GoRoute(
        path: VendorKycUnderReviewPage.path,
        name: VendorKycUnderReviewPage.name,
        builder: (_, _) => const Scaffold(body: Text('under-review-page')),
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
  group('VendorKycTransactionPinPage', () {
    testWidgets('shows pin setup screen', (tester) async {
      tester.view.physicalSize = const Size(1170, 2532);
      tester.view.devicePixelRatio = 3;
      addTearDown(tester.view.reset);

      await tester.pumpWidget(buildApp());
      await tester.pumpAndSettle();

      expect(find.text('Set up your transaction Pin'), findsOneWidget);
      expect(find.text('Choose a 4 digit transaction PIN'), findsOneWidget);
    });

    testWidgets('shows submitted sheet on 4 digits and continues to review', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(1170, 2532);
      tester.view.devicePixelRatio = 3;
      addTearDown(tester.view.reset);

      await tester.pumpWidget(buildApp());
      await tester.pumpAndSettle();

      await tester.tap(find.text('1'));
      await tester.tap(find.text('2'));
      await tester.tap(find.text('3'));
      await tester.tap(find.text('4'));
      await tester.pumpAndSettle();

      expect(find.text('Verification Request Submited'), findsOneWidget);

      await tester.tap(find.text('Continue'));
      await tester.pumpAndSettle();

      expect(find.text('under-review-page'), findsOneWidget);
    });
  });
}
