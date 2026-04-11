import 'package:eventra/features/client/client_bookings/presentation/pages/catalog_item_gallery_page.dart';
import 'package:eventra/features/client/client_bookings/presentation/widgets/catalog_item_detail_header.dart';
import 'package:eventra/features/client/client_bookings/presentation/widgets/catalog_item_thumbnail_strip.dart';
import 'package:eventra/features/client/vendor_details/domain/models/catalog_item.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../helpers/pump_app.dart';

void main() {
  const catalogItem = CatalogItem(
    id: 'cat-001',
    title: 'Pre-wedding Photoshoot',
    description: 'A beautiful pre-wedding session.',
    price: 500000,
    image: EventraImages.weddingImage,
    whatToExpect: ['3 outfits', '20 edited pictures'],
    images: [
      EventraImages.weddingImage,
      EventraImages.onboardingImage2,
      EventraImages.cameramanImage,
    ],
  );

  testWidgets('shows thumbnail strip when item has multiple images', (
    tester,
  ) async {
    await tester.pumpApp(
      const CatalogItemDetailHeader(
        item: catalogItem,
        vendorName: 'Pozera Events',
      ),
    );

    expect(find.byType(CatalogItemThumbnailStrip), findsOneWidget);
    expect(
      find.byKey(const ValueKey('catalog-item-thumbnail-0')),
      findsOneWidget,
    );
    expect(
      find.byKey(const ValueKey('catalog-item-thumbnail-1')),
      findsOneWidget,
    );
    expect(
      find.byKey(const ValueKey('catalog-item-thumbnail-2')),
      findsOneWidget,
    );
  });

  testWidgets('opens fullscreen gallery when a thumbnail is tapped', (
    tester,
  ) async {
    await tester.pumpApp(
      const CatalogItemDetailHeader(
        item: catalogItem,
        vendorName: 'Pozera Events',
      ),
    );

    await tester.tap(find.byKey(const ValueKey('catalog-item-thumbnail-1')));
    await tester.pumpAndSettle();

    expect(find.byType(CatalogItemGalleryPage), findsOneWidget);
  });
}
