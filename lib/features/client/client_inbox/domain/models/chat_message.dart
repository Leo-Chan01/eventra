import 'package:equatable/equatable.dart';
import 'package:eventra/features/client/client_bookings/presentation/models/enquiry_flow_details_args.dart';
import 'package:eventra/features/client/vendor_details/domain/models/catalog_item.dart';

enum ChatMessageType {
  text,
  enquiry,
  invoice,
  statusInReview,
  statusConfirmed,
}

class ChatMessage extends Equatable {
  const ChatMessage({
    required this.id,
    required this.text,
    required this.isFromClient,
    required this.time,
    this.enquiryAttachment,
    this.enquiryFlowArgs,
    this.type = ChatMessageType.text,
    this.showStatusAction = false,
  });

  final String id;
  final String text;
  final bool isFromClient;
  final String time;
  final CatalogItem? enquiryAttachment;
  final EnquiryFlowDetailsArgs? enquiryFlowArgs;
  final ChatMessageType type;
  final bool showStatusAction;

  @override
  List<Object?> get props => [
    id,
    text,
    isFromClient,
    time,
    enquiryAttachment,
    enquiryFlowArgs,
    type,
    showStatusAction,
  ];
}
