import 'package:eventra/features/client/vendor_details/domain/models/catalog_item.dart';
import 'package:eventra/features/client/vendor_details/presentation/widgets/vendor_catalog_item_card.dart';
import 'package:eventra/features/client/vendor_details/presentation/widgets/vendor_detail_add_tile.dart';
import 'package:eventra/features/client/vendor_details/presentation/widgets/vendor_detail_catalog_tab.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../helpers/pump_app.dart';

void main() {
  const items = [
    CatalogItem(
      id: 'catalog-1',
      title: 'Intimate Event Decor',
      description: 'This is an intimate decoration and its comes.',
      price: 10000,
      image: EventraImages.weddingImage,
      whatToExpect: ['Decor setup'],
    ),
  ];

  testWidgets('renders catalog list and trailing add tile in vendor mode', (
    tester,
  ) async {
    await tester.pumpApp(
      Material(
        child: VendorDetailCatalogTab(
          items: items,
          isVendorMode: true,
          onItemTap: (_) {},
        ),
      ),
    );

    expect(find.byType(VendorCatalogItemCard), findsOneWidget);
    expect(find.byType(VendorDetailAddTile), findsOneWidget);
    expect(find.text('Intimate Event Decor'), findsOneWidget);
  });

  testWidgets('hides add tile outside vendor mode', (tester) async {
    await tester.pumpApp(
      const Material(
        child: VendorDetailCatalogTab(
          items: [],
          onItemTap: _noopOnCatalogItemTap,
        ),
      ),
    );

    expect(find.byType(VendorCatalogItemCard), findsNothing);
    expect(find.byType(VendorDetailAddTile), findsNothing);
  });

  testWidgets('triggers callback when add tile is tapped', (tester) async {
    var didTapAdd = false;

    await tester.pumpApp(
      Material(
        child: VendorDetailCatalogTab(
          items: const [],
          isVendorMode: true,
          onItemTap: _noopOnCatalogItemTap,
          onAddTap: () {
            didTapAdd = true;
          },
        ),
      ),
    );

    await tester.tap(find.byType(VendorDetailAddTile));
    await tester.pump();

    expect(didTapAdd, isTrue);
  });
}

void _noopOnCatalogItemTap(CatalogItem _) {}
