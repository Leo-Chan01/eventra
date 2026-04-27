import 'package:eventra/app/view/app.dart';
import 'package:eventra/features/account_type_tracker/domain/repositories/account_type_tracker_repository.dart';
import 'package:eventra/features/account_type_tracker/presentation/bloc/account_type_tracker_bloc.dart';
import 'package:eventra/features/auth/signup/presentation/pages/vendor_kyc_page.dart';
import 'package:eventra/features/client/client_bookings/presentation/bloc/client_booking_bloc.dart';
import 'package:eventra/features/client/client_inbox/presentation/bloc/client_inbox_bloc.dart';
import 'package:eventra/features/client/vendor_details/presentation/bloc/vendor_detail_bloc.dart';
import 'package:eventra/features/client/vendor_details/presentation/models/vendor_detail_page_args.dart';
import 'package:eventra/features/client/vendor_details/presentation/pages/vendor_detail_page.dart';
import 'package:eventra/features/home/presentation/bloc/home_bloc.dart';
import 'package:eventra/features/home/presentation/pages/home_page.dart';
import 'package:eventra/features/home/presentation/pages/profile_notification_settings_page.dart';
import 'package:eventra/features/home/presentation/pages/profile_personal_information_page.dart';
import 'package:eventra/features/home/presentation/pages/profile_vendor_contract_page.dart';
import 'package:eventra/features/home/presentation/widgets/eventra_bottom_nav.dart';
import 'package:eventra/features/home/presentation/widgets/vendor_inbox_tab.dart';
import 'package:eventra/features/onboarding/onboarding_loading/presentation/pages/onboarding_loading_page.dart';
import 'package:eventra/features/onboarding/onboarding_slides/domain/models/account_type.dart';
import 'package:eventra/features/onboarding/onboarding_slides/presentation/pages/onboarding_slides_page.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

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

    testWidgets('vendor home View Messages opens vendor inbox tab', (
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

      await tester.scrollUntilVisible(
        find.text('View Messages'),
        200,
        scrollable: find.byType(Scrollable).first,
      );
      await tester.tap(find.text('View Messages'));
      await tester.pumpAndSettle();

      expect(find.text('Inbox'), findsOneWidget);
      expect(find.byType(VendorInboxTab), findsOneWidget);
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

    testWidgets('vendor contract tile opens the vendor contract page', (
      tester,
    ) async {
      final router = GoRouter(
        initialLocation: HomePage.path,
        routes: [
          GoRoute(
            path: HomePage.path,
            name: HomePage.name,
            builder: (context, state) => const HomePage(isVendorMode: true),
          ),
          GoRoute(
            path: ProfileVendorContractPage.path,
            name: ProfileVendorContractPage.name,
            builder: (context, state) => const ProfileVendorContractPage(),
          ),
        ],
      );

      await tester.pumpWidget(
        MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => HomeBloc()),
            BlocProvider(create: (_) => ClientInboxBloc()),
          ],
          child: ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            builder: (_, _) => MaterialApp.router(
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              routerConfig: router,
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('nav_tab_4')));
      await tester.pumpAndSettle();

      await tester.scrollUntilVisible(
        find.text("View Vendor's Contract"),
        240,
        scrollable: find.byType(Scrollable).first,
      );
      await tester.tap(find.text("View Vendor's Contract"));
      await tester.pumpAndSettle();

      expect(
        find.byKey(const Key('profile_vendor_contract_page')),
        findsOneWidget,
      );
      expect(find.text('Service Agreement'), findsOneWidget);
      expect(find.text('Chioma Okafor'), findsOneWidget);
    });

    testWidgets('vendor KYC banner opens the KYC start page', (tester) async {
      final router = GoRouter(
        initialLocation: '${HomePage.path}?vendor=true',
        routes: [
          GoRoute(
            path: HomePage.path,
            name: HomePage.name,
            builder: (context, state) => const HomePage(isVendorMode: true),
          ),
          GoRoute(
            path: VendorKycPage.path,
            name: VendorKycPage.name,
            builder: (context, state) => const VendorKycPage(),
          ),
        ],
      );

      await tester.pumpWidget(
        MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => HomeBloc()),
            BlocProvider(create: (_) => ClientInboxBloc()),
          ],
          child: ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            builder: (_, _) => MaterialApp.router(
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              routerConfig: router,
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('nav_tab_4')));
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('home_profile_kyc_banner')));
      await tester.pumpAndSettle();

      expect(find.text('Complete your kyc'), findsOneWidget);
      expect(find.text('NIN'), findsOneWidget);
    });

    testWidgets(
      'vendor profile catalog icon opens vendor detail in vendor mode on catalog tab',
      (tester) async {
        final router = GoRouter(
          initialLocation: '${HomePage.path}?vendor=true',
          routes: [
            GoRoute(
              path: HomePage.path,
              name: HomePage.name,
              builder: (context, state) => const HomePage(isVendorMode: true),
            ),
            GoRoute(
              path: VendorDetailPage.path,
              name: VendorDetailPage.name,
              builder: (context, state) => VendorDetailPage(
                args:
                    state.extra as VendorDetailPageArgs? ??
                    const VendorDetailPageArgs(),
              ),
            ),
          ],
        );

        await tester.pumpWidget(
          MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => HomeBloc()),
              BlocProvider(create: (_) => ClientInboxBloc()),
              BlocProvider(create: (_) => VendorDetailBloc()),
              BlocProvider(create: (_) => ClientBookingBloc()),
            ],
            child: ScreenUtilInit(
              designSize: const Size(375, 812),
              minTextAdapt: true,
              builder: (_, _) => MaterialApp.router(
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                routerConfig: router,
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        await tester.tap(find.byKey(const Key('nav_tab_4')));
        await tester.pumpAndSettle();

        await tester.tap(find.byType(InkWell).at(1));
        await tester.pumpAndSettle();

        expect(find.text('Pre-wedding Photoshoot'), findsOneWidget);
        expect(find.text('Make Enquiry'), findsNothing);
      },
    );

    testWidgets(
      'switching account type shows confirmation, splash, and home in the new mode',
      (tester) async {
        final trackerBloc = AccountTypeTrackerBloc(
          repository: _FakeAccountTypeTrackerRepository(),
        );
        final router = GoRouter(
          initialLocation: '${HomePage.path}?vendor=true',
          routes: [
            GoRoute(
              path: HomePage.path,
              name: HomePage.name,
              builder: (context, state) {
                final isGuestByQuery =
                    state.uri.queryParameters['guest'] == 'true';
                final isVendorByQuery =
                    state.uri.queryParameters['vendor'] == 'true';
                final trackerState = context
                    .read<AccountTypeTrackerBloc>()
                    .state;
                final isVendorByTracker =
                    !trackerState.isGuestMode &&
                    trackerState.selectedAccountType == AccountType.vendor;

                return HomePage(
                  isGuestMode: isGuestByQuery || trackerState.isGuestMode,
                  isVendorMode: isVendorByQuery || isVendorByTracker,
                );
              },
            ),
            GoRoute(
              path: OnboardingLoadingPage.path,
              name: OnboardingLoadingPage.name,
              builder: (context, state) => const OnboardingLoadingPage(),
            ),
            GoRoute(
              path: OnboardingSlidesPage.path,
              name: OnboardingSlidesPage.name,
              builder: (context, state) => const SizedBox.shrink(),
            ),
          ],
        );

        await tester.pumpWidget(
          MultiBlocProvider(
            providers: [
              BlocProvider.value(value: trackerBloc),
              BlocProvider(create: (_) => HomeBloc()),
              BlocProvider(create: (_) => ClientInboxBloc()),
            ],
            child: ScreenUtilInit(
              designSize: const Size(375, 812),
              minTextAdapt: true,
              builder: (_, _) => MaterialApp.router(
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                routerConfig: router,
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        await tester.tap(find.byKey(const Key('nav_tab_4')));
        await tester.pumpAndSettle();

        await tester.scrollUntilVisible(
          find.text('Switch To Client'),
          240,
          scrollable: find.byType(Scrollable).first,
        );
        await tester.tap(find.text('Switch To Client').first);
        await tester.pumpAndSettle();

        expect(find.text('Switch account type?'), findsOneWidget);

        await tester.tap(
          find.descendant(
            of: find.byType(Dialog),
            matching: find.text('Switch To Client'),
          ),
        );
        await tester.pump();

        expect(
          router.routeInformationProvider.value.uri.path,
          OnboardingLoadingPage.path,
        );

        await tester.pump(const Duration(seconds: 3));
        await tester.pumpAndSettle();

        await tester.tap(find.byKey(const Key('nav_tab_4')));
        await tester.pumpAndSettle();

        expect(find.text('Switch To Vendor'), findsOneWidget);
        expect(find.byKey(const Key('home_profile_kyc_banner')), findsNothing);
      },
    );

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

class _FakeAccountTypeTrackerRepository
    implements AccountTypeTrackerRepository {
  AccountType? _selectedAccountType;
  bool _isGuestMode = false;

  @override
  Future<void> clear() async {
    _selectedAccountType = null;
    _isGuestMode = false;
  }

  @override
  Future<AccountType?> getSelectedAccountType() async => _selectedAccountType;

  @override
  Future<bool> isGuestMode() async => _isGuestMode;

  @override
  Future<void> saveGuestMode() async {
    _selectedAccountType = null;
    _isGuestMode = true;
  }

  @override
  Future<void> saveSelectedAccountType(AccountType accountType) async {
    _selectedAccountType = accountType;
    _isGuestMode = false;
  }
}
