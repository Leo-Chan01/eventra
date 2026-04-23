import 'package:bloc_test/bloc_test.dart';
import 'package:eventra/features/account_type_tracker/presentation/bloc/account_type_tracker_bloc.dart';
import 'package:eventra/features/onboarding/onboarding_slides/domain/models/account_type.dart';
import 'package:eventra/features/onboarding/onboarding_slides/presentation/widgets/account_selection_bottom_sheet.dart';
import 'package:eventra/features/onboarding/onboarding_slides/presentation/widgets/account_type_card.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';

class _MockAccountTypeTrackerBloc
    extends MockBloc<AccountTypeTrackerEvent, AccountTypeTrackerState>
    implements AccountTypeTrackerBloc {}

class _FakeAccountTypeTrackerEvent extends Fake
    implements AccountTypeTrackerEvent {}

Widget _buildApp(_MockAccountTypeTrackerBloc trackerBloc) {
  final router = GoRouter(
    initialLocation: '/onboarding',
    routes: [
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => BlocProvider<AccountTypeTrackerBloc>.value(
          value: trackerBloc,
          child: Scaffold(
            body: Builder(
              builder: (ctx) => ElevatedButton(
                onPressed: () => showModalBottomSheet<void>(
                  context: ctx,
                  builder: (_) => BlocProvider<AccountTypeTrackerBloc>.value(
                    value: trackerBloc,
                    child: const AccountSelectionBottomSheet(),
                  ),
                ),
                child: const Text('open'),
              ),
            ),
          ),
        ),
      ),
      GoRoute(
        path: '/signup',
        name: 'signup',
        builder: (_, _) => const Scaffold(),
      ),
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (_, _) => const Scaffold(),
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
  late _MockAccountTypeTrackerBloc trackerBloc;

  setUpAll(() {
    registerFallbackValue(_FakeAccountTypeTrackerEvent());
  });

  setUp(() {
    trackerBloc = _MockAccountTypeTrackerBloc();
    when(() => trackerBloc.state).thenReturn(AccountTypeTrackerState.initial());
    when(() => trackerBloc.stream).thenAnswer((_) => const Stream.empty());
  });

  group('AccountSelectionBottomSheet', () {
    testWidgets(
      'dispatches AccountTypeSelected(vendor) when vendor card is tapped',
      (
        tester,
      ) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(tester.view.resetPhysicalSize);
        await tester.pumpWidget(_buildApp(trackerBloc));
        await tester.pumpAndSettle();
        await tester.tap(find.text('open'));
        await tester.pumpAndSettle();

        final vendorCards = find.byType(AccountTypeCard);
        expect(vendorCards, findsNWidgets(2));
        // Second card is vendor
        await tester.tap(vendorCards.last);
        await tester.pump();

        verify(
          () => trackerBloc.add(
            any(
              that: isA<AccountTypeSelected>().having(
                (e) => e.accountType,
                'accountType',
                AccountType.vendor,
              ),
            ),
          ),
        ).called(1);

        // Drain the pending 400ms navigation timer
        await tester.pump(const Duration(milliseconds: 400));
      },
    );

    testWidgets('dispatches GuestModeEnabled when guest button is tapped', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      await tester.pumpWidget(_buildApp(trackerBloc));
      await tester.pumpAndSettle();
      await tester.tap(find.text('open'));
      await tester.pumpAndSettle();

      final guestButton = find.byType(TextButton);
      expect(guestButton, findsOneWidget);

      await tester.tap(guestButton);
      await tester.pump();

      verify(() => trackerBloc.add(const GuestModeEnabled())).called(1);
    });
  });
}
