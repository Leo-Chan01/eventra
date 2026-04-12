import 'package:eventra/shared/widgets/eventra_buttons/eventra_like_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/pump_app.dart';

void main() {
  testWidgets('regular constructor renders without blur filter', (
    tester,
  ) async {
    await tester.pumpApp(
      const Scaffold(
        body: Center(
          child: EventraLikeButton.regular(isLiked: false),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(EventraLikeButton), findsOneWidget);
    expect(find.byType(BackdropFilter), findsNothing);
    expect(find.byIcon(Icons.favorite_border_rounded), findsOneWidget);
  });

  testWidgets('blur glass constructor renders with blur filter', (
    tester,
  ) async {
    await tester.pumpApp(
      const Scaffold(
        body: Center(
          child: EventraLikeButton.blurGlassVersion(isLiked: true),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(EventraLikeButton), findsOneWidget);
    expect(find.byType(BackdropFilter), findsOneWidget);
    expect(find.byIcon(Icons.favorite_rounded), findsOneWidget);
  });
}
