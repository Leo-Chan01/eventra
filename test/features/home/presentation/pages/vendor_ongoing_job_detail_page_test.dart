import 'package:eventra/features/client/client_bookings/presentation/models/enquiry_flow_details_args.dart';
import 'package:eventra/features/client/client_bookings/presentation/pages/enquiry_contract_page.dart';
import 'package:eventra/features/home/domain/models/vendor.dart';
import 'package:eventra/features/home/presentation/pages/vendor_ongoing_job_detail_page.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

void main() {
  testWidgets(
    'vendor ongoing page renders design content and completion dialog',
    (
      tester,
    ) async {
      const vendor = Vendor(
        id: 'vendor-004',
        name: 'Jennifer Micheal',
        category: 'Decoration',
        rating: 4.9,
        reviewsCount: 120,
        image: EventraImages.decoratorPerson,
        location: 'Ikeja, Lagos',
        startingPrice: 180000,
      );

      final router = GoRouter(
        initialLocation: VendorOngoingJobDetailPage.path,
        initialExtra: EnquiryFlowDetailsArgs(
          vendor: vendor,
          invoiceId: '6354728',
          bookingReferenceId: '737367483929210',
          amount: 10500000,
          dateIssued: DateTime(2025, 4, 24),
          eventDate: DateTime(2025, 7, 6),
          eventType: 'Decoration',
          location: 'No. 22 Bamidele street, Ikeja',
          eventTime: '12:00 PM',
          inspirationImages: const [
            EventraImages.weddingImage,
            EventraImages.womanWithweddinggown,
            EventraImages.decoratorPerson,
          ],
          deliverables: 'Let me send what i am trying to recreate',
          termsAndConditions: 'Sample terms',
        ),
        routes: [
          GoRoute(
            path: VendorOngoingJobDetailPage.path,
            name: VendorOngoingJobDetailPage.name,
            builder: (context, state) => const VendorOngoingJobDetailPage(),
          ),
          GoRoute(
            path: EnquiryContractPage.path,
            name: EnquiryContractPage.name,
            builder: (context, state) => const EnquiryContractPage(),
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

      expect(find.text('View Receipt'), findsOneWidget);
      expect(find.text('Upload inspirational image'), findsOneWidget);
      expect(find.text('Additional Note'), findsOneWidget);
      expect(find.text('View Contract'), findsOneWidget);
      expect(find.text('I have completed the Job'), findsOneWidget);

      await tester.ensureVisible(find.text('View Contract'));
      await tester.tap(find.text('View Contract'));
      await tester.pumpAndSettle();

      expect(find.text('Service Agreement'), findsOneWidget);

      await tester.tap(find.byType(IconButton).first);
      await tester.pumpAndSettle();

      await tester.ensureVisible(find.text('I have completed the Job'));
      await tester.tap(find.text('I have completed the Job'));
      await tester.pumpAndSettle();

      expect(find.text('Job Completed'), findsOneWidget);
      expect(find.text('Okay'), findsOneWidget);
    },
  );
}
