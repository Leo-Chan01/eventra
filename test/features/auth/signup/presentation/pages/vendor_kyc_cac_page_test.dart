import 'package:eventra/features/auth/signup/presentation/pages/vendor_kyc_cac_page.dart';
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
      home: VendorKycCacPage(),
    ),
  );
}

void main() {
  group('VendorKycCacPage', () {
    testWidgets('shows CAC screen content', (tester) async {
      await tester.pumpWidget(_buildApp());
      await tester.pumpAndSettle();

      expect(find.text('CAC Certificate'), findsOneWidget);
      expect(
        find.text('Kindly enter your BN so we can validate your business name'),
        findsOneWidget,
      );
      expect(find.text('Business Number (C.A.C)'), findsOneWidget);
      expect(find.text('e.g 6354647482'), findsOneWidget);
      expect(find.text('Continue'), findsOneWidget);
    });

    testWidgets('continue stays disabled when field is empty', (tester) async {
      await tester.pumpWidget(_buildApp());
      await tester.pumpAndSettle();

      final continueButton = tester.widget<ElevatedButton>(
        find
            .descendant(
              of: find.byType(VendorKycCacPage),
              matching: find.byType(ElevatedButton),
            )
            .first,
      );

      expect(continueButton.onPressed, isNull);
    });
  });
}
