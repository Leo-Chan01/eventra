import 'package:eventra/features/client/client_bookings/presentation/models/enquiry_flow_details_args.dart';
import 'package:eventra/features/home/domain/models/vendor.dart';
import 'package:eventra/features/home/presentation/pages/vendor_completed_job_detail_page.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

void main() {
  testWidgets('vendor completed job detail page renders expected sections', (
    tester,
  ) async {
    const vendor = Vendor(
      id: 'vendor-004',
      name: 'Jennifer Micheal',
      category: 'Wedding',
      rating: 4.9,
      reviewsCount: 120,
      image: EventraImages.decoratorPerson,
      location: 'Ikeja, Lagos',
      startingPrice: 180000,
    );

    final router = GoRouter(
      initialLocation: VendorCompletedJobDetailPage.path,
      initialExtra: EnquiryFlowDetailsArgs(
        vendor: vendor,
        invoiceId: '6354728',
        bookingReferenceId: '737367483929210',
        amount: 1000000,
        dateIssued: DateTime(2025, 4, 24),
        eventDate: DateTime(2025, 6, 30),
        eventType: 'Wedding',
        location: 'No. 22 Bamidele street, Ikeja',
        eventTime: '12:00 PM',
        inspirationImages: const [
          EventraImages.weddingImage,
          EventraImages.womanWithweddinggown,
          EventraImages.decoratorPerson,
        ],
        deliverables: 'Decor setup and styling',
        termsAndConditions: 'Sample terms',
      ),
      routes: [
        GoRoute(
          path: VendorCompletedJobDetailPage.path,
          name: VendorCompletedJobDetailPage.name,
          builder: (context, state) => const VendorCompletedJobDetailPage(),
        ),
      ],
    );

    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        builder: (_, _) => MaterialApp.router(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          routerConfig: router,
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Completed'), findsOneWidget);
    expect(find.text('Client Information'), findsOneWidget);
    expect(find.text('Events Details'), findsOneWidget);
    expect(find.text('Moses Simon'), findsOneWidget);
    expect(find.text('₦1,000,000.00'), findsOneWidget);
  });
}
