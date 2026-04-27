import 'package:eventra/features/client/vendor_details/domain/models/vendor_video.dart';
import 'package:eventra/features/client/vendor_details/presentation/widgets/vendor_detail_add_tile.dart';
import 'package:eventra/features/client/vendor_details/presentation/widgets/vendor_detail_videos_tab.dart';
import 'package:eventra/features/client/vendor_details/presentation/widgets/vendor_video_thumbnail.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../helpers/pump_app.dart';

void main() {
  const videos = [
    VendorVideo(
      thumbnailUrl: EventraImages.weddingImage,
      viewCount: 300,
    ),
    VendorVideo(
      thumbnailUrl: EventraImages.onboardingImage2,
      viewCount: 30,
    ),
  ];

  testWidgets('renders video grid with thumbnails and view counts', (
    tester,
  ) async {
    await tester.pumpApp(
      const VendorDetailVideosTab(
        videos: videos,
        isVendorMode: true,
      ),
    );

    expect(find.byType(VendorVideoThumbnail), findsNWidgets(2));
    expect(find.byType(VendorDetailAddTile), findsOneWidget);
    expect(find.text('300'), findsOneWidget);
    expect(find.text('30'), findsOneWidget);

    final gridView = tester.widget<GridView>(find.byType(GridView));
    final delegate =
        gridView.gridDelegate as SliverGridDelegateWithFixedCrossAxisCount;

    expect(delegate.crossAxisCount, 2);
  });

  testWidgets('triggers callback when add tile is tapped', (tester) async {
    var didTapAdd = false;

    await tester.pumpApp(
      VendorDetailVideosTab(
        videos: const [],
        isVendorMode: true,
        onAddTap: () {
          didTapAdd = true;
        },
      ),
    );

    await tester.tap(find.byType(VendorDetailAddTile));
    await tester.pump();

    expect(didTapAdd, isTrue);
  });
}
