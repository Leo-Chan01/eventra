import 'package:eventra/shared/widgets/app_share_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('AppShareBottomSheet', () {
    testWidgets('renders share contacts social options and copy action', (
      tester,
    ) async {
      await tester.pumpApp(
        const Scaffold(
          body: AppShareBottomSheet(
            shareText: 'Kenny & Femi on Eventra',
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Send to your contact'), findsOneWidget);
      expect(find.text('Share to'), findsOneWidget);
      expect(find.text('Copy'), findsOneWidget);
      expect(find.text('WhatsApp'), findsOneWidget);
      expect(find.text('Instagram'), findsWidgets);
    });
  });
}
