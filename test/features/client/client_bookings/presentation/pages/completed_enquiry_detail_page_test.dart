import 'package:eventra/features/client/client_bookings/presentation/pages/completed_enquiry_detail_page.dart';
import 'package:eventra/features/home/domain/models/vendor.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

void main() {
  testWidgets('completed enquiry detail page renders review actions', (
    tester,
  ) async {
    const vendor = Vendor(
      id: 'vendor-004',
      name: 'Pozera Events',
      category: 'Decoration',
      rating: 4.9,
      reviewsCount: 120,
      image: EventraImages.decoratorPerson,
      location: 'Lekki, Lagos',
      startingPrice: 180000,
    );

    final router = GoRouter(
      initialLocation: CompletedEnquiryDetailPage.path,
      initialExtra: CompletedEnquiryDetailPageArgs(
        vendor: vendor,
        invoiceId: '6354728',
        bookingReferenceId: '737367483929210',
        amountPaid: 10500000,
        dateIssued: DateTime(2025, 4, 24),
        eventDate: DateTime(2025, 7, 6),
      ),
      routes: [
        GoRoute(
          path: CompletedEnquiryDetailPage.path,
          name: CompletedEnquiryDetailPage.name,
          builder: (context, state) => const CompletedEnquiryDetailPage(),
        ),
      ],
    );

    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        builder: (_, __) => MaterialApp.router(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          routerConfig: router,
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Send Reviews'), findsWidgets);
    expect(find.textContaining('Invoice ID'), findsOneWidget);
    expect(find.text('Report Vendor'), findsOneWidget);
  });
}
