import 'package:eventra/features/client/vendor_details/domain/models/vendor_detail.dart';
import 'package:eventra/features/home/presentation/widgets/vendor_edit_profile_body.dart';
import 'package:eventra/features/home/presentation/widgets/vendor_edit_profile_service_field.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/pump_app.dart';

const _vendor = VendorDetail(
  id: 'vendor-001',
  name: 'Pozera Events',
  bio: 'Vendor bio',
  tags: ['Decor'],
  rating: 4.8,
  reviewsCount: 12,
  coverImage: EventraImages.onboardingImage1,
  profileImage: EventraImages.onboardingImage2,
  location: 'Lagos',
  followersCount: 100,
  services: ['Full Venue Decoration', 'Table & Chair Setup'],
  catalogItems: [],
  videos: [],
  reviews: [],
  relatedVendors: [],
);

void main() {
  testWidgets('add more appends a new service field', (tester) async {
    await tester.pumpApp(
      const Scaffold(
        body: VendorEditProfileBody(vendor: _vendor),
      ),
    );

    expect(find.byType(VendorEditProfileServiceField), findsNWidgets(2));

    await tester.tap(find.text('Add more'));
    await tester.pumpAndSettle();

    expect(find.byType(VendorEditProfileServiceField), findsNWidgets(3));
  });
}
