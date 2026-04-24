import 'package:eventra/features/auth/signup/presentation/pages/vendor_kyc_bank_details_page.dart';
import 'package:eventra/features/auth/signup/presentation/pages/vendor_kyc_transaction_pin_page.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

Widget buildApp() {
  final router = GoRouter(
    initialLocation: VendorKycBankDetailsPage.path,
    routes: [
      GoRoute(
        path: VendorKycBankDetailsPage.path,
        name: VendorKycBankDetailsPage.name,
        builder: (_, _) => const VendorKycBankDetailsPage(),
      ),
      GoRoute(
        path: VendorKycTransactionPinPage.path,
        name: VendorKycTransactionPinPage.name,
        builder: (_, _) => const Scaffold(body: Text('transaction-pin-page')),
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
  group('VendorKycBankDetailsPage', () {
    testWidgets('continue is disabled initially', (tester) async {
      await tester.pumpWidget(buildApp());
      await tester.pumpAndSettle();

      final continueButton = tester.widget<ElevatedButton>(
        find
            .descendant(
              of: find.byType(VendorKycBankDetailsPage),
              matching: find.byType(ElevatedButton),
            )
            .first,
      );

      expect(continueButton.onPressed, isNull);
    });

    testWidgets('shows verified name and enables continue on valid input', (
      tester,
    ) async {
      await tester.pumpWidget(buildApp());
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextFormField).first, '1234567890');
      await tester.pumpAndSettle();

      await tester.tap(find.text('Select'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Access Bank'));
      await tester.pumpAndSettle();

      expect(find.text('Kebokwu Ogechukwu Paul'), findsOneWidget);

      final continueButton = tester.widget<ElevatedButton>(
        find
            .descendant(
              of: find.byType(VendorKycBankDetailsPage),
              matching: find.byType(ElevatedButton),
            )
            .first,
      );
      expect(continueButton.onPressed, isNotNull);

      await tester.tap(find.text('Continue'));
      await tester.pumpAndSettle();
      expect(find.text('transaction-pin-page'), findsOneWidget);
    });
  });
}
