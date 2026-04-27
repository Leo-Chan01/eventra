import 'package:eventra/features/client/client_bookings/presentation/pages/invoice_ready_page.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../helpers/pump_app.dart';

void main() {
  group('InvoiceReadyPage', () {
    testWidgets('renders ready state and send invoice button', (tester) async {
      await tester.pumpApp(const InvoiceReadyPage());
      await tester.pumpAndSettle();

      expect(find.text('Your invoice is ready'), findsOneWidget);
      expect(find.text('Share with your customer'), findsOneWidget);
      expect(find.text('Send Invoice'), findsOneWidget);
    });
  });
}
