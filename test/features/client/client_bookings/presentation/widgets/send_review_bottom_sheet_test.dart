import 'package:eventra/features/client/client_bookings/presentation/widgets/send_review_bottom_sheet.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../helpers/pump_app.dart';

void main() {
  testWidgets('dismisses keyboard when tapping outside the input', (
    tester,
  ) async {
    await tester.pumpApp(
      const Scaffold(
        body: SendReviewBottomSheet(
          vendorName: 'Pozera Events',
          vendorImage: EventraImages.decoratorPerson,
        ),
      ),
    );

    await tester.tap(find.byType(TextField));
    await tester.pumpAndSettle();

    final editableBefore = tester.widget<EditableText>(
      find.byType(EditableText),
    );
    expect(editableBefore.focusNode.hasFocus, isTrue);

    final sheetTopLeft = tester.getTopLeft(find.byType(SendReviewBottomSheet));
    await tester.tapAt(sheetTopLeft + const Offset(20, 20));
    await tester.pumpAndSettle();

    final editableAfter = tester.widget<EditableText>(
      find.byType(EditableText),
    );
    expect(editableAfter.focusNode.hasFocus, isFalse);
  });
}
