import 'package:eventra/features/auth/signup/presentation/pages/vendor_kyc_under_review_page.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

Widget buildApp() {
  return ScreenUtilInit(
    designSize: const Size(375, 812),
    minTextAdapt: true,
    builder: (_, _) => const MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: VendorKycUnderReviewPage(),
    ),
  );
}

void main() {
  group('VendorKycUnderReviewPage', () {
    testWidgets('shows under review content', (tester) async {
      tester.view.physicalSize = const Size(1170, 2532);
      tester.view.devicePixelRatio = 3;
      addTearDown(tester.view.reset);

      await tester.pumpWidget(buildApp());
      await tester.pumpAndSettle();

      expect(find.text('Your details are under review'), findsOneWidget);
      expect(
        find.text(
          'You will be notified within 24 hours once yor details has been reviewed',
        ),
        findsOneWidget,
      );
      expect(find.text('Home'), findsOneWidget);
    });
  });
}
