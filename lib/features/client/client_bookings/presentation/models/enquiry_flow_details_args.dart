import 'package:eventra/features/home/domain/models/vendor.dart';

class EnquiryFlowDetailsArgs {
  const EnquiryFlowDetailsArgs({
    required this.vendor,
    required this.invoiceId,
    required this.bookingReferenceId,
    required this.amount,
    required this.dateIssued,
    required this.eventDate,
    required this.eventType,
    required this.location,
    required this.eventTime,
    required this.inspirationImages,
    required this.deliverables,
    required this.termsAndConditions,
  });

  final Vendor vendor;
  final String invoiceId;
  final String bookingReferenceId;
  final double amount;
  final DateTime dateIssued;
  final DateTime eventDate;
  final String eventType;
  final String location;
  final String eventTime;
  final List<String> inspirationImages;
  final String deliverables;
  final String termsAndConditions;
}
