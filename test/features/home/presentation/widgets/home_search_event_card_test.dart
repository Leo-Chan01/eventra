import 'package:eventra/features/home/domain/models/home_search_event_item.dart';
import 'package:eventra/features/home/presentation/widgets/home_search_event_card.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/pump_app.dart';

void main() {
  const event = HomeSearchEventItem(
    imagePath: EventraImages.weddingImage,
    category: 'Music',
    title: 'Burna Boy Live In Concert',
    description: 'Live at Eko Hotel',
    price: '₦5,000',
    location: 'Lagos',
    dateTime: 'Sat, Dec 24, 2025',
  );

  testWidgets('calls onTap when event card is tapped', (tester) async {
    var tapCount = 0;

    await tester.pumpApp(
      Scaffold(
        body: HomeSearchEventCard(
          event: event,
          onTap: () {
            tapCount += 1;
          },
        ),
      ),
    );

    await tester.tap(find.byType(HomeSearchEventCard));
    await tester.pumpAndSettle();

    expect(tapCount, 1);
  });
}
