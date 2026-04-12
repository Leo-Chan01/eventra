import 'package:eventra/features/client/client_bookings/presentation/bloc/client_booking_bloc.dart';
import 'package:eventra/features/client/client_bookings/presentation/pages/enquiry_form_page.dart';
import 'package:eventra/features/client/client_bookings/presentation/pages/enquiry_review_page.dart';
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
  description: 'Complete décor for your big day.',
  price: 450000,
  image: '',
  whatToExpect: ['Decoration', 'Setup'],
);

const _testArgs = EnquiryFormPageArgs(
  vendorId: 'vendor-001',
  vendorName: 'Pozera Events',
  vendorImage: EventraImages.decoratorPerson,
  catalogItem: _testCatalogItem,
);

GoRouter _buildRouter({
  required ClientBookingBloc bloc,
}) {
  return GoRouter(
    initialLocation: EnquiryFormPage.path,
    routes: [
      GoRoute(
        path: EnquiryFormPage.path,
        name: EnquiryFormPage.name,
        builder: (context, state) => BlocProvider.value(
          value: bloc,
          child: const EnquiryFormPage(),
        ),
      ),
      GoRoute(
        path: EnquiryReviewPage.path,
        name: EnquiryReviewPage.name,
        builder: (context, state) => BlocProvider.value(
          value: bloc,
          child: const EnquiryReviewPage(),
        ),
      ),
    ],
    redirect: (context, state) {
      if (state.matchedLocation == EnquiryFormPage.path &&
          state.extra == null) {
        return null;
      }
      return null;
    },
  );
}

Widget _buildApp({required ClientBookingBloc bloc, GoRouter? router}) {
  return ScreenUtilInit(
    designSize: const Size(375, 812),
    minTextAdapt: true,
    builder: (_, _) => MaterialApp.router(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: router ?? _buildRouter(bloc: bloc),
    ),
  );
}

void main() {
  group('EnquiryFormPage', () {
    testWidgets('renders form title and vendor info', (tester) async {
      final bloc = ClientBookingBloc();
      addTearDown(bloc.close);

      final router = GoRouter(
        initialLocation: EnquiryFormPage.path,
        initialExtra: _testArgs,
        routes: [
          GoRoute(
            path: EnquiryFormPage.path,
            name: EnquiryFormPage.name,
            builder: (context, state) => BlocProvider.value(
              value: bloc,
              child: const EnquiryFormPage(),
            ),
          ),
          GoRoute(
            path: EnquiryReviewPage.path,
            name: EnquiryReviewPage.name,
            builder: (context, state) => BlocProvider.value(
              value: bloc,
              child: const EnquiryReviewPage(),
            ),
          ),
        ],
      );

      await tester.pumpWidget(_buildApp(bloc: bloc, router: router));
      await tester.pumpAndSettle();

      expect(find.text('Enquiry'), findsWidgets);
      expect(find.text('Pozera Events'), findsOneWidget);
      expect(find.text('Full Wedding Package'), findsOneWidget);
    });

    testWidgets('renders all form fields', (tester) async {
      final bloc = ClientBookingBloc();
      addTearDown(bloc.close);

      final router = GoRouter(
        initialLocation: EnquiryFormPage.path,
        initialExtra: _testArgs,
        routes: [
          GoRoute(
            path: EnquiryFormPage.path,
            name: EnquiryFormPage.name,
            builder: (context, state) => BlocProvider.value(
              value: bloc,
              child: const EnquiryFormPage(),
            ),
          ),
          GoRoute(
            path: EnquiryReviewPage.path,
            name: EnquiryReviewPage.name,
            builder: (context, state) => BlocProvider.value(
              value: bloc,
              child: const EnquiryReviewPage(),
            ),
          ),
        ],
      );

      await tester.pumpWidget(_buildApp(bloc: bloc, router: router));
      await tester.pumpAndSettle();

      expect(find.text('Event Type'), findsOneWidget);
      expect(find.text('Event Location'), findsOneWidget);
      expect(find.text('Number of Guest'), findsOneWidget);
      expect(find.text('Budget Range (Optional)'), findsOneWidget);
      expect(find.text('Event Date & Time'), findsOneWidget);
      expect(find.text('Additional Notes'), findsOneWidget);
    });
  });

  group('EnquiryReviewPage', () {
    testWidgets('renders review title', (tester) async {
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
        ..add(const EnquiryReviewRequested());

      await tester.pumpWidget(
        _buildApp(
          bloc: bloc,
          router: GoRouter(
            initialLocation: EnquiryReviewPage.path,
            routes: [
              GoRoute(
                path: EnquiryReviewPage.path,
                name: EnquiryReviewPage.name,
                builder: (context, state) => BlocProvider.value(
                  value: bloc,
                  child: const EnquiryReviewPage(),
                ),
              ),
            ],
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Review Enquiry'), findsOneWidget);
    });

    testWidgets('shows vendor name and catalog item from bloc state', (
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
        ..add(const EnquiryReviewRequested());

      await tester.pumpWidget(
        _buildApp(
          bloc: bloc,
          router: GoRouter(
            initialLocation: EnquiryReviewPage.path,
            routes: [
              GoRoute(
                path: EnquiryReviewPage.path,
                name: EnquiryReviewPage.name,
                builder: (context, state) => BlocProvider.value(
                  value: bloc,
                  child: const EnquiryReviewPage(),
                ),
              ),
            ],
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Pozera Events'), findsOneWidget);
      expect(find.text('Full Wedding Package'), findsOneWidget);
    });

    testWidgets('shows Send Enquiry button', (tester) async {
      final bloc = ClientBookingBloc();
      addTearDown(bloc.close);

      bloc.add(
        const EnquiryFormInitiated(
          vendorId: 'vendor-001',
          vendorName: 'Pozera Events',
          catalogItem: _testCatalogItem,
        ),
      );

      await tester.pumpWidget(
        _buildApp(
          bloc: bloc,
          router: GoRouter(
            initialLocation: EnquiryReviewPage.path,
            routes: [
              GoRoute(
                path: EnquiryReviewPage.path,
                name: EnquiryReviewPage.name,
                builder: (context, state) => BlocProvider.value(
                  value: bloc,
                  child: const EnquiryReviewPage(),
                ),
              ),
            ],
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Send Enquiry'), findsOneWidget);
    });
  });
}
