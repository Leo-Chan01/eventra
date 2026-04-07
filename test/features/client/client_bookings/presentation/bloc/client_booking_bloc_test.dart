import 'package:bloc_test/bloc_test.dart';
import 'package:eventra/features/client/client_bookings/presentation/bloc/client_booking_bloc.dart';
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

  group('ClientBookingBloc', () {
    test('initial state is idle with empty fields', () {
      final bloc = ClientBookingBloc();
      addTearDown(bloc.close);

      expect(bloc.state.status, BookingStatus.idle);
      expect(bloc.state.enquiryVendorName, '');
      expect(bloc.state.enquiryCatalogItemTitle, '');
      expect(bloc.state.enquiryVendorId, '');
    });

    blocTest<ClientBookingBloc, ClientBookingState>(
      'EnquirySubmitted transitions to submitted status',
      build: ClientBookingBloc.new,
      act: (bloc) => bloc.add(
        const EnquirySubmitted(
          vendorId: 'vendor-001',
          vendorName: 'Pozera Events',
          catalogItem: testCatalogItem,
        ),
      ),
      expect: () => [
        isA<ClientBookingState>()
            .having((s) => s.status, 'status', BookingStatus.submitted)
            .having((s) => s.enquiryVendorName, 'vendorName', 'Pozera Events')
            .having(
              (s) => s.enquiryCatalogItemTitle,
              'catalogItemTitle',
              'Full Wedding Package',
            )
            .having((s) => s.enquiryVendorId, 'vendorId', 'vendor-001'),
      ],
    );

    blocTest<ClientBookingBloc, ClientBookingState>(
      'EnquiryReset clears the booking state',
      build: ClientBookingBloc.new,
      act: (bloc) => bloc
        ..add(
          const EnquirySubmitted(
            vendorId: 'vendor-001',
            vendorName: 'Pozera Events',
            catalogItem: testCatalogItem,
          ),
        )
        ..add(const EnquiryReset()),
      expect: () => [
        isA<ClientBookingState>().having(
          (s) => s.status,
          'status',
          BookingStatus.submitted,
        ),
        isA<ClientBookingState>().having(
          (s) => s.status,
          'status',
          BookingStatus.idle,
        ),
      ],
      verify: (bloc) {
        expect(bloc.state.enquiryVendorName, '');
        expect(bloc.state.enquiryVendorId, '');
      },
    );
  });
}
