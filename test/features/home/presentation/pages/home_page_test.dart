import 'package:eventra/app/view/app.dart';
import 'package:eventra/features/client/client_inbox/presentation/bloc/client_inbox_bloc.dart';
import 'package:eventra/features/home/presentation/bloc/home_bloc.dart';
import 'package:eventra/features/home/presentation/pages/home_page.dart';
import 'package:eventra/features/home/presentation/pages/profile_notification_settings_page.dart';
import 'package:eventra/features/home/presentation/pages/profile_personal_information_page.dart';
import 'package:eventra/features/home/presentation/widgets/eventra_bottom_nav.dart';
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

    testWidgets('search field opens search page', (tester) async {
      await tester.pumpApp(
        BlocProvider(
          create: (_) => HomeBloc(),
          child: const HomePage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('home_search_field')), findsOneWidget);
      await tester.tap(find.byKey(const Key('home_search_field')));
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('home_search_page')), findsOneWidget);
      expect(find.byKey(const Key('home_search_tab_events')), findsOneWidget);
      expect(find.text('Summer Music Festival'), findsOneWidget);
    });

    testWidgets('bottom search action opens search page', (tester) async {
      await tester.pumpApp(
        BlocProvider(
          create: (_) => HomeBloc(),
          child: const HomePage(),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('nav_tab_2')));
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('home_search_page')), findsOneWidget);
    });

    testWidgets('tapping a category opens the category vendors page', (
      tester,
    ) async {
      await tester.pumpWidget(const App());
      await tester.pumpAndSettle();

      await tester.tap(find.text('Decorator'));
      await tester.pumpAndSettle();

      expect(find.text('Decorator'), findsWidgets);
      expect(find.textContaining('Featured Vendors'), findsOneWidget);
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

      expect(find.byKey(const Key('home_enquiry_status_list')), findsOneWidget);
    });

    testWidgets('completed enquiry tab shows enquiry cards', (tester) async {
      await tester.pumpApp(
        BlocProvider(
          create: (_) => HomeBloc()..add(const HomeTabChanged(1)),
          child: const HomePage(),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text('Completed').last);
      await tester.pumpAndSettle();

      expect(
        find.byKey(const Key('home_enquiry_vendor_card_vendor-004')),
        findsOneWidget,
      );
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

    testWidgets('vendor reels tab opens full-screen and back exits reels', (
      tester,
    ) async {
      await tester.pumpApp(
        MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => HomeBloc()),
            BlocProvider(create: (_) => ClientInboxBloc()),
          ],
          child: const HomePage(isVendorMode: true),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('nav_tab_3')));
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('home_reel_stats_bar')), findsOneWidget);
      expect(find.byType(EventraBottomNav), findsNothing);

      await tester.tap(find.byKey(const Key('home_reel_back_button')));
      await tester.pumpAndSettle();

      expect(find.byType(EventraBottomNav), findsOneWidget);
    });

    testWidgets('reel next control moves to next reel', (tester) async {
      await tester.pumpApp(
        MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => HomeBloc()),
            BlocProvider(create: (_) => ClientInboxBloc()),
          ],
          child: const HomePage(isVendorMode: true),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('nav_tab_3')));
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('home_reel_next_button')));
      await tester.pumpAndSettle();

      expect(find.text('Royal Garden Wedding'), findsOneWidget);
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
