import 'package:equatable/equatable.dart';
import 'package:eventra/features/client/vendor_details/domain/models/catalog_item.dart';

class ChatMessage extends Equatable {
  const ChatMessage({
    required this.id,
    required this.text,
    required this.isFromClient,
    required this.time,
    this.enquiryAttachment,
    this.isEnquiryConfirmation = false,
    this.hasInvoice = false,
  });

  final String id;
  final String text;
  final bool isFromClient;
  final String time;
  final CatalogItem? enquiryAttachment;
  final bool isEnquiryConfirmation;
  final bool hasInvoice;

  @override
  List<Object?> get props => [
    id,
    text,
    isFromClient,
    time,
    enquiryAttachment,
    isEnquiryConfirmation,
    hasInvoice,
  ];
}
