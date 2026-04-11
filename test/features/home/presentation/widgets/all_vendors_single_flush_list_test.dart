import 'package:eventra/features/home/domain/models/vendor.dart';
import 'package:eventra/features/home/presentation/widgets/all_vendors_single_flush_list.dart';
import 'package:eventra/features/home/presentation/widgets/vendor_card_top_rated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/pump_app.dart';

void main() {
  const vendors = [
    Vendor(
      id: 'vendor-001',
      name: 'Pozera Events',
      category: 'Decorator',
      rating: 4.8,
      reviewsCount: 120,
      image: '',
      location: 'Lagos',
      startingPrice: 500000,
    ),
    Vendor(
      id: 'vendor-002',
      name: 'Swift Pixel',
      category: 'Photographer',
      rating: 4.6,
      reviewsCount: 86,
      image: '',
      location: 'Lagos',
      startingPrice: 250000,
    ),
  ];

  testWidgets('renders a bounded vendor list without layout exceptions', (
    tester,
  ) async {
    await tester.pumpApp(
      const Scaffold(
        body: SingleChildScrollView(
          child: AllVendorsSingleFlushList(vendors: vendors),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(VendorCardTopRated), findsNWidgets(2));
    expect(tester.takeException(), isNull);
  });
}
