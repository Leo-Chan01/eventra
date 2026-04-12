import 'package:eventra/features/client/client_bookings/presentation/bloc/client_booking_bloc.dart';
import 'package:eventra/features/client/client_bookings/presentation/pages/enquiry_sent_page.dart';
import 'package:eventra/features/client/client_bookings/presentation/pages/pending_enquiry_detail_page.dart';
import 'package:eventra/features/client/vendor_details/domain/models/catalog_item.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

const _testCatalogItem = CatalogItem(
  id: 'item-001',
  title: 'Full Wedding Package',
  description: 'Complete decor for your big day.',
  price: 450000,
  image: '',
  whatToExpect: ['Decoration', 'Setup'],
);

Widget _buildApp({required ClientBookingBloc bloc, required GoRouter router}) {
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
  group('EnquirySentPage', () {
    testWidgets('view enquiry opens pending page with populated details', (
      tester,
    ) async {
      final bloc = ClientBookingBloc();
      addTearDown(bloc.close);

      bloc
        ..add(
          const EnquiryFormInitiated(
            vendorId: 'vendor-001',
            vendorName: 'Pozera Events',
            catalogItem: _testCatalogItem,
          ),
        )
        ..add(
          EnquiryFormFieldChanged(
            eventType: 'weddings',
            location: '22 Bamidele street, Ikeja',
            eventDate: DateTime(2026, 4, 12, 12),
            budget: '1000 - 5000',
            imageUrls: const [EventraImages.weddingImage],
          ),
        )
        ..add(
          const EnquirySubmitted(
            vendorId: 'vendor-001',
            vendorName: 'Pozera Events',
            catalogItemTitle: 'Full Wedding Package',
          ),
        );

      final router = GoRouter(
        initialLocation: EnquirySentPage.path,
        routes: [
          GoRoute(
            path: EnquirySentPage.path,
            name: EnquirySentPage.name,
            builder: (context, state) => BlocProvider.value(
              value: bloc,
              child: const EnquirySentPage(),
            ),
          ),
          GoRoute(
            path: PendingEnquiryDetailPage.path,
            name: PendingEnquiryDetailPage.name,
            builder: (context, state) => const PendingEnquiryDetailPage(),
          ),
        ],
      );

      await tester.pumpWidget(_buildApp(bloc: bloc, router: router));
      await tester.pumpAndSettle();

      await tester.tap(find.text('View Enquiry'));
      await tester.pumpAndSettle();

      expect(find.text('Your enquiry is still pending'), findsOneWidget);
      expect(find.text('Pozera Events'), findsOneWidget);
      expect(find.text('Weddings'), findsOneWidget);
      expect(find.text('22 Bamidele street, Ikeja'), findsWidgets);
    });
  });
}
