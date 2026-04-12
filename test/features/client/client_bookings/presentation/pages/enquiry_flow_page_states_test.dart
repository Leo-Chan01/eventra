import 'package:eventra/features/client/client_bookings/presentation/models/enquiry_flow_details_args.dart';
import 'package:eventra/features/client/client_bookings/presentation/pages/active_enquiry_detail_page.dart';
import 'package:eventra/features/client/client_bookings/presentation/pages/awaiting_payment_enquiry_page.dart';
import 'package:eventra/features/client/client_bookings/presentation/pages/enquiry_contract_page.dart';
import 'package:eventra/features/client/client_bookings/presentation/pages/enquiry_invoice_page.dart';
import 'package:eventra/features/client/client_bookings/presentation/pages/payment_received_page.dart';
import 'package:eventra/features/client/client_bookings/presentation/pages/pending_enquiry_detail_page.dart';
import 'package:eventra/features/home/domain/models/vendor.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

void main() {
  const vendor = Vendor(
    id: 'vendor-004',
    name: 'Pozera Events',
    category: 'Decoration',
    rating: 4.8,
    reviewsCount: 342,
    image: EventraImages.decoratorPerson,
    location: 'Lagos, Nigeria',
    startingPrice: 180000,
  );

  final args = EnquiryFlowDetailsArgs(
    vendor: vendor,
    invoiceId: '6354728',
    bookingReferenceId: '737367483929210',
    amount: 10500000,
    dateIssued: DateTime(2025, 4, 24),
    eventDate: DateTime(2025, 7, 6),
    eventType: 'Wedding Ceremony',
    location: '22 Bamidele street, Ikeja',
    eventTime: '12:00 PM',
    inspirationImages: [
      EventraImages.weddingImage,
      EventraImages.womanWithweddinggown,
      EventraImages.decoratorPerson,
    ],
    deliverables: '10 photography with 5 outfit',
    termsAndConditions: 'Only 10 edited pictures',
  );

  group('Enquiry flow page states', () {
    testWidgets('pending enquiry page renders expected content', (
      tester,
    ) async {
      await _setMobileViewport(tester);

      final router = GoRouter(
        initialLocation: PendingEnquiryDetailPage.path,
        initialExtra: args,
        routes: [
          GoRoute(
            path: PendingEnquiryDetailPage.path,
            name: PendingEnquiryDetailPage.name,
            builder: (context, state) => const PendingEnquiryDetailPage(),
          ),
        ],
      );

      await _pumpRouter(tester, router);

      expect(find.text('Your enquiry is still pending'), findsOneWidget);
      expect(find.text('Event Details'), findsOneWidget);
      expect(find.text('Deliverables'), findsOneWidget);
    });

    testWidgets('awaiting payment opens payment sheet and success page', (
      tester,
    ) async {
      await _setMobileViewport(tester);

      final router = GoRouter(
        initialLocation: AwaitingPaymentEnquiryPage.path,
        initialExtra: args,
        routes: [
          GoRoute(
            path: AwaitingPaymentEnquiryPage.path,
            name: AwaitingPaymentEnquiryPage.name,
            builder: (context, state) => const AwaitingPaymentEnquiryPage(),
          ),
          GoRoute(
            path: PaymentReceivedPage.path,
            name: PaymentReceivedPage.name,
            builder: (context, state) => const PaymentReceivedPage(),
          ),
          GoRoute(
            path: EnquiryInvoicePage.path,
            name: EnquiryInvoicePage.name,
            builder: (context, state) => const EnquiryInvoicePage(),
          ),
          GoRoute(
            path: EnquiryContractPage.path,
            name: EnquiryContractPage.name,
            builder: (context, state) => const EnquiryContractPage(),
          ),
          GoRoute(
            path: ActiveEnquiryDetailPage.path,
            name: ActiveEnquiryDetailPage.name,
            builder: (context, state) => const ActiveEnquiryDetailPage(),
          ),
        ],
      );

      await _pumpRouter(tester, router);

      await tester.tap(find.text('Make Payment'));
      await tester.pumpAndSettle();
      expect(find.text('Upload Payment slip'), findsOneWidget);

      await tester.ensureVisible(find.text('Continue'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Continue'));
      await tester.pumpAndSettle();

      expect(find.text('Payment Received'), findsOneWidget);
      expect(find.text('Back to Enquiry'), findsOneWidget);
    });

    testWidgets('active enquiry page renders ongoing state', (tester) async {
      await _setMobileViewport(tester);

      final router = GoRouter(
        initialLocation: ActiveEnquiryDetailPage.path,
        initialExtra: args,
        routes: [
          GoRoute(
            path: ActiveEnquiryDetailPage.path,
            name: ActiveEnquiryDetailPage.name,
            builder: (context, state) => const ActiveEnquiryDetailPage(),
          ),
        ],
      );

      await _pumpRouter(tester, router);

      expect(find.text('Job Ongoing'), findsOneWidget);
      expect(find.text('Report Vendor'), findsOneWidget);
    });
  });
}

Future<void> _setMobileViewport(WidgetTester tester) async {
  tester.view.physicalSize = const Size(1170, 2532);
  tester.view.devicePixelRatio = 3;
  addTearDown(() {
    tester.view.resetPhysicalSize();
    tester.view.resetDevicePixelRatio();
  });
}

Future<void> _pumpRouter(WidgetTester tester, GoRouter router) async {
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
