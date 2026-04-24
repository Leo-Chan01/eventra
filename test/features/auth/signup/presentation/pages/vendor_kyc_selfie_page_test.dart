import 'package:eventra/features/auth/signup/presentation/pages/vendor_kyc_selfie_page.dart';
import 'package:eventra/features/auth/signup/presentation/widgets/selfie_oval_overlay.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

Widget _buildApp() {
  final router = GoRouter(
    initialLocation: VendorKycSelfiePage.path,
    routes: [
      GoRoute(
        path: VendorKycSelfiePage.path,
        name: VendorKycSelfiePage.name,
        builder: (_, _) => const VendorKycSelfiePage(),
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
  group('VendorKycSelfiePage', () {
    testWidgets('renders without crashing (no camera hardware in test env)', (
      tester,
    ) async {
      await tester.pumpWidget(_buildApp());
      await tester.pump();

      expect(find.byType(VendorKycSelfiePage), findsOneWidget);
    });

    testWidgets('shows back button', (tester) async {
      await tester.pumpWidget(_buildApp());
      await tester.pump();

      expect(find.byType(IconButton), findsOneWidget);
    });

    testWidgets('shows selfie oval overlay', (tester) async {
      await tester.pumpWidget(_buildApp());
      await tester.pump();

      expect(find.byType(SelfieOvalOverlay), findsOneWidget);
    });

    testWidgets('shows Move Closer label', (tester) async {
      await tester.pumpWidget(_buildApp());
      await tester.pump();

      expect(find.text('Move Closer'), findsOneWidget);
    });
  });
}
