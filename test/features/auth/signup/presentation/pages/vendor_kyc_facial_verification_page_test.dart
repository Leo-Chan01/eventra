import 'package:eventra/features/auth/signup/presentation/pages/vendor_kyc_facial_verification_page.dart';
import 'package:eventra/features/auth/signup/presentation/pages/vendor_kyc_selfie_page.dart';
import 'package:eventra/features/auth/signup/presentation/widgets/selfie_hint_item.dart';
import 'package:eventra/features/auth/signup/presentation/widgets/selfie_permission_dialog.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/shared/widgets/eventra_buttons/eventra_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

Widget _buildApp() {
  final router = GoRouter(
    initialLocation: VendorKycFacialVerificationPage.path,
    routes: [
      GoRoute(
        path: VendorKycFacialVerificationPage.path,
        name: VendorKycFacialVerificationPage.name,
        builder: (_, _) => const VendorKycFacialVerificationPage(),
      ),
      GoRoute(
        path: VendorKycSelfiePage.path,
        name: VendorKycSelfiePage.name,
        builder: (_, _) => const Scaffold(body: Text('vendor-kyc-selfie-page')),
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
  group('VendorKycFacialVerificationPage', () {
    testWidgets('shows selfie intro content', (tester) async {
      await tester.pumpWidget(_buildApp());
      await tester.pumpAndSettle();

      expect(find.text('Selfie'), findsOneWidget);
      expect(
        find.text(
          'Please take a clear picture of yourself. We need your selfie to confirm you are you',
        ),
        findsOneWidget,
      );
      expect(find.byType(SelfieHintItem), findsNWidgets(2));
      expect(find.text('Uncovered face'), findsOneWidget);
      expect(find.text('Good lighting'), findsOneWidget);
      expect(find.byType(EventraButton), findsOneWidget);
      expect(find.text('Continue'), findsOneWidget);
    });

    testWidgets('shows back button in app bar', (tester) async {
      await tester.pumpWidget(_buildApp());
      await tester.pumpAndSettle();

      expect(find.byType(IconButton), findsOneWidget);
    });

    testWidgets('tapping Continue shows permission dialog', (tester) async {
      await tester.pumpWidget(_buildApp());
      await tester.pumpAndSettle();

      await tester.tap(find.text('Continue'));
      await tester.pumpAndSettle();

      expect(find.byType(SelfiePermissionDialog), findsOneWidget);
      expect(find.text('We need some device permissions'), findsOneWidget);
      expect(find.text("Don't Allow"), findsOneWidget);
      expect(find.text('Allow'), findsOneWidget);
    });

    testWidgets('tapping Don\'t Allow dismisses permission dialog', (
      tester,
    ) async {
      await tester.pumpWidget(_buildApp());
      await tester.pumpAndSettle();

      await tester.tap(find.text('Continue'));
      await tester.pumpAndSettle();

      expect(find.byType(SelfiePermissionDialog), findsOneWidget);

      await tester.tap(find.text("Don't Allow"));
      await tester.pumpAndSettle();

      expect(find.byType(SelfiePermissionDialog), findsNothing);
      expect(find.text('Selfie'), findsOneWidget);
    });
  });
}
