import 'package:eventra/features/client/client_notification/presentation/bloc/client_notification_bloc.dart';
import 'package:eventra/features/client/client_notification/presentation/pages/client_notifications_page.dart';
import 'package:eventra/features/client/client_notification/presentation/pages/transaction_details_page.dart';
import 'package:eventra/features/client/client_notification/presentation/pages/transaction_history_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../helpers/pump_app.dart';

void main() {
  group('Client notification pages', () {
    testWidgets('ClientNotificationsPage renders the notification list', (
      tester,
    ) async {
      await tester.pumpApp(
        BlocProvider(
          create: (_) => ClientNotificationBloc(),
          child: const ClientNotificationsPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Notification'), findsOneWidget);
      expect(find.text('All (8)'), findsOneWidget);
      expect(find.text('Unread (3)'), findsOneWidget);

      await tester.scrollUntilVisible(
        find.text('Payment Successful'),
        300,
      );

      expect(find.text('Payment Successful'), findsOneWidget);
    });

    testWidgets('TransactionHistoryPage renders the summary and records', (
      tester,
    ) async {
      await tester.pumpApp(
        BlocProvider(
          create: (_) => ClientNotificationBloc(),
          child: const TransactionHistoryPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Transaction History'), findsOneWidget);
      expect(find.text('Total Spent'), findsOneWidget);
      expect(find.text('Total Refunds'), findsOneWidget);
      expect(find.text('Elegant Decor Lagos'), findsOneWidget);
    });

    testWidgets('TransactionDetailsPage renders the full payment breakdown', (
      tester,
    ) async {
      await tester.pumpApp(
        BlocProvider(
          create: (_) => ClientNotificationBloc(),
          child: const TransactionDetailsPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Transaction Details'), findsOneWidget);
      expect(find.text('Payment Successful'), findsOneWidget);
      expect(find.text('Vendor Details'), findsOneWidget);
      expect(find.text('Payment Breakdown'), findsOneWidget);
      expect(find.text('Download Receipt'), findsOneWidget);
    });
  });
}
