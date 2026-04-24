import 'package:eventra/features/auth/signup/presentation/pages/vendor_kyc_nin_page.dart';
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
      home: VendorKycNinPage(),
    ),
  );
}

void main() {
  group('VendorKycNinPage', () {
    testWidgets('shows NIN screen content', (tester) async {
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
      expect(find.text('64547433737'), findsOneWidget);
      expect(find.text('Continue'), findsOneWidget);
    });
  });
}
