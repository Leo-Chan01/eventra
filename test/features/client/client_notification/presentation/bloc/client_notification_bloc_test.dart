import 'package:bloc_test/bloc_test.dart';
import 'package:eventra/features/client/client_notification/presentation/bloc/client_notification_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ClientNotificationBloc', () {
    test('seeds notifications and transactions', () {
      final bloc = ClientNotificationBloc();
      addTearDown(bloc.close);

      expect(bloc.state.notifications, hasLength(8));
      expect(bloc.state.unreadCount, 3);
      expect(bloc.state.transactions, isNotEmpty);
      expect(bloc.state.selectedTransaction.vendorName, 'Elegant Decor Lagos');
    });

    blocTest<ClientNotificationBloc, ClientNotificationState>(
      'updates notification tab filter',
      build: ClientNotificationBloc.new,
      act: (bloc) => bloc.add(
        const NotificationTabChanged(NotificationTab.unread),
      ),
      expect: () => [
        isA<ClientNotificationState>()
            .having(
              (state) => state.notificationTab,
              'notificationTab',
              NotificationTab.unread,
            )
            .having(
              (state) => state.visibleNotifications.length,
              'visibleNotifications',
              3,
            ),
      ],
    );

    blocTest<ClientNotificationBloc, ClientNotificationState>(
      'filters transactions by status and search query',
      build: ClientNotificationBloc.new,
      act: (bloc) => bloc
        ..add(const TransactionFilterChanged(TransactionFilter.completed))
        ..add(const TransactionSearchChanged('Elegant')),
      expect: () => [
        isA<ClientNotificationState>().having(
          (state) => state.transactionFilter,
          'transactionFilter',
          TransactionFilter.completed,
        ),
        isA<ClientNotificationState>()
            .having((state) => state.searchQuery, 'searchQuery', 'Elegant')
            .having(
              (state) => state.visibleTransactions.first.vendorName,
              'firstVendor',
              'Elegant Decor Lagos',
            ),
      ],
    );
  });
}
