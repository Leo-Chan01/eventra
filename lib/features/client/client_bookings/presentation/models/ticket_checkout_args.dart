import 'package:equatable/equatable.dart';

class TicketCheckoutArgs extends Equatable {
  const TicketCheckoutArgs({
    required this.eventTitle,
    required this.eventImage,
    required this.location,
    required this.eventDate,
    required this.ticketType,
    required this.ticketQuantity,
    required this.unitPrice,
    required this.attendeeEmail,
    required this.bookingReferenceId,
  });

  final String eventTitle;
  final String eventImage;
  final String location;
  final DateTime eventDate;
  final String ticketType;
  final int ticketQuantity;
  final double unitPrice;
  final String attendeeEmail;
  final String bookingReferenceId;

  double get totalAmount => unitPrice * ticketQuantity;

  @override
  List<Object?> get props => [
    eventTitle,
    eventImage,
    location,
    eventDate,
    ticketType,
    ticketQuantity,
    unitPrice,
    attendeeEmail,
    bookingReferenceId,
  ];
}

enum TicketPaymentMethod { card, transfer, ussd }
