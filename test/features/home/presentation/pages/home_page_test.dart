import 'package:eventra/features/home/presentation/bloc/home_bloc.dart';
import 'package:eventra/features/home/presentation/pages/home_page.dart';
import 'package:eventra/features/home/presentation/pages/profile_notification_settings_page.dart';
import 'package:eventra/features/home/presentation/pages/profile_personal_information_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/pump_app.dart';

void main() {
  group('HomePage', () {
    testWidgets('renders the current home discovery content', (
      tester,
    ) async {
      await tester.pumpApp(
        BlocProvider(
          create: (_) => HomeBloc(),
          child: const HomePage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Hello,'), findsOneWidget);
      expect(find.byKey(const Key('home_search_field')), findsOneWidget);
      expect(find.byKey(const Key('home_filter_button')), findsOneWidget);
    });

    testWidgets('filter icon opens the new additive filter sheet', (
      tester,
    ) async {
      await tester.pumpApp(
        BlocProvider(
          create: (_) => HomeBloc(),
          child: const HomePage(),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('home_filter_button')));
      await tester.pumpAndSettle();

      expect(find.text('Location: Lagos'), findsOneWidget);
      expect(
        find.byKey(const Key('home_filter_location_button')),
        findsOneWidget,
      );
      expect(find.text('Categories'), findsOneWidget);
      expect(find.text('Price Range'), findsOneWidget);
    });

    testWidgets('location icon in filter sheet opens the address sheet', (
      tester,
    ) async {
      await tester.pumpApp(
        BlocProvider(
          create: (_) => HomeBloc(),
          child: const HomePage(),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('home_filter_button')));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('home_filter_location_button')));
      await tester.pumpAndSettle();

      expect(find.text('Your current address'), findsOneWidget);
      expect(
        find.byKey(const Key('home_location_search_input')),
        findsOneWidget,
      );
    });

    testWidgets('search field opens the location lookup view', (tester) async {
      await tester.pumpApp(
        BlocProvider(
          create: (_) => HomeBloc(),
          child: const HomePage(),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('home_search_field')));
      await tester.pumpAndSettle();

      expect(find.text('Your current address'), findsOneWidget);
      expect(
        find.byKey(const Key('home_location_search_input')),
        findsOneWidget,
      );
    });

    testWidgets('switches tabs from the bottom navigation', (tester) async {
      await tester.pumpApp(
        BlocProvider(
          create: (_) => HomeBloc(),
          child: const HomePage(),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('nav_tab_1')));
      await tester.pumpAndSettle();

      expect(find.text('Explore vendors near you'), findsOneWidget);
    });

    testWidgets('reels tab shows a tiktok style feed', (tester) async {
      await tester.pumpApp(
        BlocProvider(
          create: (_) => HomeBloc(),
          child: const HomePage(),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('nav_tab_3')));
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('home_reels_feed')), findsOneWidget);
      expect(find.text('Kenny & Femi'), findsOneWidget);
      expect(find.text('283'), findsOneWidget);
    });

    testWidgets('profile tab shows the settings layout', (tester) async {
      await tester.pumpApp(
        BlocProvider(
          create: (_) => HomeBloc(),
          child: const HomePage(),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('nav_tab_4')));
      await tester.pumpAndSettle();

      expect(find.text('Settings'), findsOneWidget);
      expect(find.text('Chioma Okafor'), findsOneWidget);
      expect(find.text('Personal Information'), findsOneWidget);
      expect(find.text('Log Out'), findsOneWidget);
    });

    testWidgets('personal information page renders profile details', (
      tester,
    ) async {
      await tester.pumpApp(
        BlocProvider(
          create: (_) => HomeBloc(),
          child: const ProfilePersonalInformationPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Personal Information'), findsOneWidget);
      expect(find.text('Phone number'), findsOneWidget);
      expect(find.text('Date of Birth'), findsOneWidget);
      expect(find.text('Address'), findsOneWidget);
    });

    testWidgets('notification settings page renders toggles', (tester) async {
      await tester.pumpApp(
        BlocProvider(
          create: (_) => HomeBloc(),
          child: const ProfileNotificationSettingsPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Notification'), findsOneWidget);
      expect(find.text('Push Notifications'), findsOneWidget);
      expect(find.text('Booking Updates'), findsOneWidget);
      expect(find.text('Promotions & Offers'), findsOneWidget);
    });
  });
}
