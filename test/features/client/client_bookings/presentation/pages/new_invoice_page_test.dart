import 'package:eventra/features/client/client_bookings/presentation/pages/new_invoice_page.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

void main() {
  group('NewInvoicePage', () {
    testWidgets('renders invoice form without legacy summary actions', (
      tester,
    ) async {
      final router = GoRouter(
        initialLocation: NewInvoicePage.path,
        initialExtra: NewInvoicePageArgs(
          bookingId: 'book-1234',
          clientName: 'Ademola Micheal',
          clientAvatarPath: EventraImages.janeDoe,
          eventType: 'Wedding',
          eventDate: DateTime(2025, 4, 12),
        ),
        routes: [
          GoRoute(
            path: NewInvoicePage.path,
            name: NewInvoicePage.name,
            builder: (context, state) => const NewInvoicePage(),
          ),
        ],
      );

      await _pumpRouter(tester, router);

      expect(find.text('New Invoice'), findsOneWidget);
      expect(find.text('Ademola Micheal'), findsOneWidget);
      expect(find.text('Event Type: Wedding'), findsOneWidget);
      expect(find.text('Date: 12 April, 2025'), findsOneWidget);
      expect(find.text('Add Item Details'), findsOneWidget);
      expect(find.text('Generate Invoice'), findsOneWidget);
      expect(find.text('Add'), findsNothing);
      expect(find.text('Subtotal'), findsNothing);
      expect(find.text('Total'), findsNothing);
      expect(find.text('INV-BOOK'), findsAtLeastNWidgets(1));
    });
  });
}

Future<void> _pumpRouter(WidgetTester tester, GoRouter router) async {
  tester.view.physicalSize = const Size(1170, 2532);
  tester.view.devicePixelRatio = 3;
  addTearDown(() {
    tester.view.resetPhysicalSize();
    tester.view.resetDevicePixelRatio();
  });

  await tester.pumpWidget(
    ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) => MaterialApp.router(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        routerConfig: router,
      ),
    ),
  );
  await tester.pumpAndSettle();
}
