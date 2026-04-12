import 'package:eventra/features/client/client_bookings/presentation/pages/review_submitted_page.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../helpers/pump_app.dart';

void main() {
  testWidgets('review submitted page renders thank you state', (tester) async {
    await tester.pumpApp(const ReviewSubmittedPage());
    await tester.pumpAndSettle();

    expect(find.text('Thank you'), findsOneWidget);
    expect(find.text('Back to Home'), findsOneWidget);
  });
}
