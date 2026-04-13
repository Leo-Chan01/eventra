import 'package:eventra/features/client/client_bookings/presentation/models/ticket_checkout_args.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('totalAmount returns quantity multiplied by unitPrice', () {
    final args = TicketCheckoutArgs(
      eventTitle: 'Burna Boy Live In Concert',
      eventImage: 'image.png',
      location: 'Eko Hotel, Lagos',
      eventDate: DateTime(2025, 5, 18, 22),
      ticketType: 'Regular',
      ticketQuantity: 3,
      unitPrice: 5000,
      attendeeEmail: 'test@example.com',
      bookingReferenceId: 'REF-001',
    );

    expect(args.totalAmount, 15000);
  });
}
