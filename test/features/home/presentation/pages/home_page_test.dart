import 'package:eventra/features/home/presentation/bloc/home_bloc.dart';
import 'package:eventra/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/pump_app.dart';

void main() {
  group('HomePage', () {
    testWidgets('renders the discovery sections from the mockup', (
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
      expect(find.text('Featured Vendors'), findsOneWidget);
      expect(find.text('Top Rated Vendors'), findsOneWidget);
      expect(find.text('Vendors of the week'), findsOneWidget);
      expect(find.text('Add a Vendor'), findsOneWidget);
    });

    testWidgets('opens the filter sheet and location lookup flow', (
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

      expect(find.text('Filter'), findsOneWidget);
      expect(find.text('Your current address'), findsOneWidget);

      await tester.tap(find.byKey(const Key('home_location_field')));
      await tester.pumpAndSettle();

      expect(find.text('Location Lookup'), findsOneWidget);
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
  });
}
