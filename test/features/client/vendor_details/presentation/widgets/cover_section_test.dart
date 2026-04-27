import 'package:eventra/features/client/vendor_details/domain/models/vendor_detail.dart';
import 'package:eventra/features/client/vendor_details/presentation/widgets/cover_section.dart';
import 'package:eventra/features/home/presentation/models/vendor_edit_profile_page_args.dart';
import 'package:eventra/features/home/presentation/pages/vendor_edit_profile_page.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

const _vendor = VendorDetail(
  id: 'vendor-001',
  name: 'Pozera Events',
  bio: 'Vendor bio',
  tags: ['Decor', 'Weddings'],
  rating: 4.8,
  reviewsCount: 12,
  coverImage: EventraImages.onboardingImage1,
  profileImage: EventraImages.onboardingImage2,
  location: 'Lagos',
  followersCount: 100,
  services: ['Decor'],
  catalogItems: [],
  videos: [],
  reviews: [],
  relatedVendors: [],
);

void main() {
  testWidgets('vendor edit button opens vendor edit profile page', (
    tester,
  ) async {
    final router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const Scaffold(
            body: CoverSection(
              vendor: _vendor,
              isVendorMode: true,
            ),
          ),
        ),
        GoRoute(
          path: VendorEditProfilePage.path,
          name: VendorEditProfilePage.name,
          builder: (context, state) => VendorEditProfilePage(
            args: state.extra! as VendorEditProfilePageArgs,
          ),
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

    await tester.tap(find.byType(GestureDetector).at(1));
    await tester.pumpAndSettle();

    expect(find.text('Edit Profile'), findsOneWidget);
    expect(find.text('Business Description'), findsOneWidget);
    expect(find.text('Save'), findsOneWidget);
  });
}
