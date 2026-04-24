import 'package:eventra/features/auth/signup/presentation/pages/vendor_kyc_gov_id_preview_page.dart';
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
      home: VendorKycGovIdPreviewPage(),
    ),
  );
}

void main() {
  group('VendorKycGovIdPreviewPage', () {
    testWidgets('shows captured ID preview content', (tester) async {
      await tester.pumpWidget(_buildApp());
      await tester.pumpAndSettle();

      expect(find.text('Scan Done'), findsOneWidget);
      expect(find.text('Continue'), findsOneWidget);
      expect(find.byType(Image), findsWidgets);
    });
  });
}
