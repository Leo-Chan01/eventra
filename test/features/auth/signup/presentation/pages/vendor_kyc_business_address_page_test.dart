import 'package:eventra/features/auth/signup/presentation/pages/vendor_kyc_business_address_page.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

Widget _buildApp() {
  return ScreenUtilInit(
    designSize: const Size(375, 812),
    minTextAdapt: true,
    builder: (_, _) => const MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: VendorKycBusinessAddressPage(),
    ),
  );
}

void main() {
  group('VendorKycBusinessAddressPage', () {
    testWidgets('shows business address form content', (tester) async {
      await tester.pumpWidget(_buildApp());
      await tester.pumpAndSettle();

      expect(find.text('Business Address Verification'), findsOneWidget);
      expect(
        find.text(
          'Please fill the from below to make it easier for us to know you.',
        ),
        findsOneWidget,
      );
      expect(find.text('Business Address'), findsOneWidget);
      expect(find.text('Landmark'), findsOneWidget);
      expect(find.text('State'), findsOneWidget);
      expect(find.text('City'), findsOneWidget);
      expect(find.text('Proof of address type'), findsOneWidget);
      expect(find.text('Upload Utility bill'), findsOneWidget);
      expect(find.text('Lagos'), findsOneWidget);
      expect(find.text('Utility bill'), findsOneWidget);
      expect(find.text('Continue'), findsOneWidget);
    });

    testWidgets('continue stays disabled initially', (tester) async {
      await tester.pumpWidget(_buildApp());
      await tester.pumpAndSettle();

      final continueButton = tester.widget<ElevatedButton>(
        find
            .descendant(
              of: find.byType(VendorKycBusinessAddressPage),
              matching: find.byType(ElevatedButton),
            )
            .first,
      );

      expect(continueButton.onPressed, isNull);
    });
  });
}
