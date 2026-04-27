import 'package:eventra/features/home/presentation/bloc/home_bloc.dart';
import 'package:eventra/features/home/presentation/pages/profile_app_reset_page.dart';
import 'package:eventra/features/home/presentation/pages/profile_app_settings_page.dart';
import 'package:eventra/features/home/presentation/pages/profile_help_support_page.dart';
import 'package:eventra/features/home/presentation/pages/profile_privacy_policy_page.dart';
import 'package:eventra/features/home/presentation/pages/profile_privacy_security_page.dart';
import 'package:eventra/features/home/presentation/pages/profile_rate_us_page.dart';
import 'package:eventra/features/home/presentation/pages/profile_saved_vendors_page.dart';
import 'package:eventra/features/home/presentation/pages/profile_terms_and_conditions_page.dart';
import 'package:eventra/features/home/presentation/pages/profile_vendor_contract_page.dart';
import 'package:eventra/shared/theme/theme_bloc.dart';
import 'package:eventra/shared/widgets/eventra_dialogs/delete_account_confirmation_dialog.dart';
import 'package:eventra/shared/widgets/eventra_dialogs/delete_account_password_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/pump_app.dart';

void main() {
  group('Profile settings pages', () {
    testWidgets('app settings page renders the client settings groups', (
      tester,
    ) async {
      await tester.pumpApp(
        MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => HomeBloc()),
            BlocProvider(create: (_) => ThemeBloc()),
          ],
          child: const ProfileAppSettingsPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('App Settings'), findsOneWidget);
      expect(find.text('Dark Mode'), findsOneWidget);
      expect(find.text('Auto-Download Images'), findsOneWidget);
      expect(find.text('Reset App'), findsOneWidget);
      expect(find.text('Terms of Service'), findsOneWidget);
    });

    testWidgets('app reset page renders caution and reset options', (
      tester,
    ) async {
      await tester.pumpApp(const ProfileAppResetPage());
      await tester.pumpAndSettle();

      expect(find.text('App Reset'), findsOneWidget);
      expect(find.text('Proceed with Caution'), findsOneWidget);
      expect(find.text('Reset Settings Only'), findsOneWidget);
      expect(find.text('Reset Everything'), findsOneWidget);
    });

    testWidgets('saved vendors page renders favourite vendor cards', (
      tester,
    ) async {
      await tester.pumpApp(
        BlocProvider(
          create: (_) => HomeBloc(),
          child: const ProfileSavedVendorsPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('My Favourite Vendors'), findsOneWidget);
      expect(find.text('360 Events'), findsOneWidget);
      expect(find.text('View Profile'), findsWidgets);
    });

    testWidgets('vendor contract page renders contract summary', (
      tester,
    ) async {
      await tester.pumpApp(
        BlocProvider(
          create: (_) => HomeBloc(),
          child: const ProfileVendorContractPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text("View Vendor's Contract"), findsOneWidget);
      expect(find.text('Chioma Okafor'), findsOneWidget);
      expect(find.text('name@gmail.com'), findsOneWidget);
      expect(find.text('4  VENDOR OBLIGATIONS'), findsOneWidget);
      expect(find.text('7  DISPUTE RESOLUTION'), findsOneWidget);
    });

    testWidgets('help support page renders faq and support CTA', (
      tester,
    ) async {
      await tester.pumpApp(const ProfileHelpSupportPage());
      await tester.pumpAndSettle();

      expect(find.text('Help'), findsOneWidget);
      expect(find.text('Frequently Asked Questions'), findsOneWidget);
      expect(find.text('Support Hours'), findsOneWidget);
      expect(find.text('Contact Support'), findsOneWidget);

      await tester.tap(find.text('How do I book a vendor?'));
      await tester.pumpAndSettle();

      expect(
        find.text(
          'Browse vendor profiles, compare packages, pick your preferred date,'
          ' and submit a booking request. You will receive a confirmation once'
          ' the vendor accepts and payment is completed.',
        ),
        findsOneWidget,
      );
    });

    testWidgets('privacy security page renders password and danger zone', (
      tester,
    ) async {
      await tester.pumpApp(
        BlocProvider(
          create: (_) => HomeBloc(),
          child: const ProfilePrivacySecurityPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Privacy & Security'), findsOneWidget);
      expect(find.text('Current Password'), findsOneWidget);
      expect(find.text('Two-Factor Authentication'), findsOneWidget);
      expect(find.text('Delete Account'), findsOneWidget);

      await tester.scrollUntilVisible(
        find.text('Delete Account'),
        240,
        scrollable: find.byType(Scrollable).first,
      );
      await tester.tap(find.text('Delete Account'));
      await tester.pumpAndSettle();

      expect(find.text('Delete Account?'), findsOneWidget);
      expect(find.text('Continue'), findsOneWidget);
    });

    testWidgets('confirmation dialog returns continue result', (tester) async {
      bool? result;

      await tester.pumpApp(
        Builder(
          builder: (context) {
            return Scaffold(
              body: Center(
                child: TextButton(
                  onPressed: () async {
                    result = await DeleteAccountConfirmationDialog.show(
                      context,
                    );
                  },
                  child: const Text('Open'),
                ),
              ),
            );
          },
        ),
      );

      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Continue'));
      await tester.pumpAndSettle();

      expect(result, isTrue);
    });

    testWidgets('password dialog passes typed password to callback', (
      tester,
    ) async {
      String? capturedPassword;

      await tester.pumpApp(
        Scaffold(
          body: DeleteAccountPasswordDialog(
            onDeleteConfirmed: (password) {
              capturedPassword = password;
            },
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'secret-pass');
      await tester.tap(find.text('Delete Account'));
      await tester.pumpAndSettle();

      expect(capturedPassword, 'secret-pass');
    });

    testWidgets('privacy policy page renders privacy information', (
      tester,
    ) async {
      await tester.pumpApp(const ProfilePrivacyPolicyPage());
      await tester.pumpAndSettle();

      expect(find.text('Privacy Policy'), findsOneWidget);
      expect(find.text('Information We Collect'), findsOneWidget);
      expect(find.text('Your Rights'), findsOneWidget);
      expect(find.text('I Understand'), findsOneWidget);
    });

    testWidgets('rate us page renders feedback controls', (tester) async {
      await tester.pumpApp(
        BlocProvider(
          create: (_) => HomeBloc(),
          child: const ProfileRateUsPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Rate Us'), findsOneWidget);
      expect(find.text("We'd Love Your Feedback!"), findsOneWidget);
      expect(find.byType(GestureDetector), findsWidgets);
    });

    testWidgets('terms page renders legal sections', (tester) async {
      await tester.pumpApp(const ProfileTermsAndConditionsPage());
      await tester.pumpAndSettle();

      expect(find.text('Terms and Conditions'), findsOneWidget);
      expect(find.text('1. DEFINITIONS'), findsOneWidget);
      expect(find.text('Contact Information'), findsOneWidget);
      expect(find.text('Acceptance'), findsOneWidget);
    });
  });
}
