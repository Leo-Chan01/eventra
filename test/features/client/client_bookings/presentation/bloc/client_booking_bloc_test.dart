import 'package:bloc_test/bloc_test.dart';
import 'package:eventra/features/client/client_bookings/domain/models/enquiry.dart';
import 'package:eventra/features/client/client_bookings/presentation/bloc/client_booking_bloc.dart';
import 'package:eventra/features/client/vendor_details/domain/models/catalog_item.dart';
import 'package:flutter_test/flutter_test.dart';

const _testCatalogItem = CatalogItem(
  id: 'item-001',
  title: 'Full Wedding Package',
  description: 'Complete décor for your big day.',
  price: 450000,
  image: '',
  whatToExpect: ['Decoration', 'Setup'],
);

void main() {
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
      'EnquiryFormInitiated sets formSubmitted status and creates enquiry',
      build: ClientBookingBloc.new,
      act: (bloc) => bloc.add(
        const EnquiryFormInitiated(
          vendorId: 'vendor-001',
          vendorName: 'Pozera Events',
          catalogItem: _testCatalogItem,
        ),
      ),
      expect: () => [
        isA<ClientBookingState>()
            .having((s) => s.status, 'status', BookingStatus.formSubmitted)
            .having((s) => s.enquiryVendorName, 'vendorName', 'Pozera Events')
            .having(
              (s) => s.enquiryCatalogItemTitle,
              'catalogItemTitle',
              'Full Wedding Package',
            )
            .having((s) => s.enquiryVendorId, 'vendorId', 'vendor-001')
            .having((s) => s.enquiry, 'enquiry', isNotNull),
      ],
    );

    blocTest<ClientBookingBloc, ClientBookingState>(
      'EnquiryFormFieldChanged updates enquiry fields',
      build: ClientBookingBloc.new,
      seed: () => ClientBookingState(
        status: BookingStatus.formSubmitted,
        enquiry: const Enquiry(
          id: 'enq-001',
          vendorId: 'vendor-001',
          vendorName: 'Pozera Events',
          catalogItemTitle: 'Full Wedding Package',
          message: '',
        ),
        enquiryVendorId: 'vendor-001',
        enquiryVendorName: 'Pozera Events',
        enquiryCatalogItemTitle: 'Full Wedding Package',
      ),
      act: (bloc) => bloc.add(
        const EnquiryFormFieldChanged(
          eventType: 'wedding',
          location: 'Lagos',
          guestCount: 200,
          budget: 'high',
          notes: 'No pork please',
        ),
      ),
      expect: () => [
        isA<ClientBookingState>()
            .having(
              (s) => s.enquiry?.eventType,
              'eventType',
              'wedding',
            )
            .having(
              (s) => s.enquiry?.location,
              'location',
              'Lagos',
            )
            .having(
              (s) => s.enquiry?.guestCount,
              'guestCount',
              200,
            )
            .having(
              (s) => s.enquiry?.budget,
              'budget',
              'high',
            )
            .having(
              (s) => s.enquiry?.notes,
              'notes',
              'No pork please',
            ),
      ],
    );

    blocTest<ClientBookingBloc, ClientBookingState>(
      'EnquiryFormFieldChanged does nothing when enquiry is null',
      build: ClientBookingBloc.new,
      act: (bloc) => bloc.add(
        const EnquiryFormFieldChanged(eventType: 'wedding'),
      ),
      expect: () => <ClientBookingState>[],
    );

    blocTest<ClientBookingBloc, ClientBookingState>(
      'EnquiryReviewRequested transitions to reviewingEnquiry status',
      build: ClientBookingBloc.new,
      seed: () => const ClientBookingState(
        status: BookingStatus.formSubmitted,
      ),
      act: (bloc) => bloc.add(const EnquiryReviewRequested()),
      expect: () => [
        isA<ClientBookingState>().having(
          (s) => s.status,
          'status',
          BookingStatus.reviewingEnquiry,
        ),
      ],
    );

    blocTest<ClientBookingBloc, ClientBookingState>(
      'EnquirySubmitted transitions to submitted status',
      build: ClientBookingBloc.new,
      act: (bloc) => bloc.add(
        const EnquirySubmitted(
          vendorId: 'vendor-001',
          vendorName: 'Pozera Events',
          catalogItemTitle: 'Full Wedding Package',
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
            catalogItemTitle: 'Full Wedding Package',
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
