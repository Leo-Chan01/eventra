import 'package:bloc_test/bloc_test.dart';
import 'package:eventra/features/client/client_inbox/presentation/bloc/client_inbox_bloc.dart';
import 'package:eventra/features/client/vendor_details/domain/models/catalog_item.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const testCatalogItem = CatalogItem(
    id: 'item-001',
    title: 'Full Wedding Package',
    description: 'Complete décor for your big day.',
    price: 450000,
    image: '',
    whatToExpect: ['Decoration', 'Setup'],
  );

  group('ClientInboxBloc', () {
    test('initial state seeds 7 threads', () {
      final bloc = ClientInboxBloc();
      addTearDown(bloc.close);

      expect(bloc.state.threads, hasLength(7));
      expect(bloc.state.searchQuery, '');
      expect(bloc.state.currentInput, '');
    });

    test('seeded thread vendor-001 (Jenny) has messages', () {
      final bloc = ClientInboxBloc();
      addTearDown(bloc.close);

      final pozeraMessages = bloc.state.allMessages['vendor-001'];
      expect(pozeraMessages, isNotNull);
      expect(pozeraMessages, isNotEmpty);
    });

    blocTest<ClientInboxBloc, ClientInboxState>(
      'InboxThreadSelected updates selectedThreadId',
      build: ClientInboxBloc.new,
      act: (bloc) => bloc.add(const InboxThreadSelected('vendor-002')),
      expect: () => [
        isA<ClientInboxState>().having(
          (s) => s.selectedThreadId,
          'selectedThreadId',
          'vendor-002',
        ),
      ],
    );

    blocTest<ClientInboxBloc, ClientInboxState>(
      'InboxSearchChanged filters visible threads',
      build: ClientInboxBloc.new,
      act: (bloc) => bloc.add(const InboxSearchChanged('Jenny')),
      expect: () => [
        isA<ClientInboxState>()
            .having((s) => s.searchQuery, 'searchQuery', 'Jenny')
            .having((s) => s.visibleThreads.length, 'visibleThreads', 1)
            .having(
              (s) => s.visibleThreads.first.vendorName,
              'vendorName',
              'Jenny',
            ),
      ],
    );

    blocTest<ClientInboxBloc, ClientInboxState>(
      'InboxSearchChanged with empty query returns all threads',
      build: ClientInboxBloc.new,
      act: (bloc) => bloc
        ..add(const InboxSearchChanged('Jenny'))
        ..add(const InboxSearchChanged('')),
      verify: (bloc) {
        expect(bloc.state.visibleThreads, hasLength(7));
      },
    );

    blocTest<ClientInboxBloc, ClientInboxState>(
      'InboxMessageSent appends message to selected thread',
      build: ClientInboxBloc.new,
      act: (bloc) => bloc
        ..add(const InboxThreadSelected('vendor-001'))
        ..add(const InboxMessageSent('Hello!')),
      verify: (bloc) {
        final messages = bloc.state.currentMessages;
        expect(messages.last.text, 'Hello!');
        expect(messages.last.isFromClient, isTrue);
      },
    );

    blocTest<ClientInboxBloc, ClientInboxState>(
      'InboxInputChanged updates currentInput',
      build: ClientInboxBloc.new,
      act: (bloc) => bloc.add(const InboxInputChanged('typing...')),
      expect: () => [
        isA<ClientInboxState>().having(
          (s) => s.currentInput,
          'currentInput',
          'typing...',
        ),
      ],
    );

    blocTest<ClientInboxBloc, ClientInboxState>(
      'InboxVendorStarted creates new thread when vendor not in list',
      build: ClientInboxBloc.new,
      act: (bloc) => bloc.add(
        const InboxVendorStarted(
          vendorId: 'vendor-999',
          vendorName: 'New Vendor',
          catalogItem: testCatalogItem,
        ),
      ),
      verify: (bloc) {
        final thread = bloc.state.threads
            .where((t) => t.id == 'vendor-999')
            .firstOrNull;
        expect(thread, isNotNull);
        expect(thread!.vendorName, 'New Vendor');
        expect(bloc.state.selectedThreadId, 'vendor-999');
      },
    );
  });
}
