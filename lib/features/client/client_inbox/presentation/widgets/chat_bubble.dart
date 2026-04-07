import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/client_inbox/domain/models/chat_message.dart';
import 'package:eventra/features/client/client_inbox/presentation/widgets/enquiry_attachment_card.dart';
import 'package:eventra/features/client/client_inbox/presentation/widgets/invoice_attachment_card.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({required this.message, super.key});

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    if (message.isEnquiryConfirmation) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Column(
          children: [
            if (message.enquiryAttachment != null)
              EnquiryAttachmentCard(item: message.enquiryAttachment!),
            if (message.enquiryAttachment == null)
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerHighest.withValues(
                    alpha: 0.3,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  message.text,
                  style: 12.w400.copyWith(
                    color: colorScheme.onSurface,
                    height: 1.4,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            if (message.hasInvoice) ...[
              8.vertSpacing,
              InvoiceAttachmentCard(onTap: () {}),
            ],
          ],
        ),
      );
    }

    if (message.hasInvoice && !message.isFromClient) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InvoiceAttachmentCard(onTap: () {}),
          ],
        ),
      );
    }

    final isFromClient = message.isFromClient;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: isFromClient
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          if (message.enquiryAttachment != null)
            Align(
              alignment: isFromClient
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: EnquiryAttachmentCard(item: message.enquiryAttachment!),
            ),
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.sizeOf(context).width * 0.72,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: isFromClient
                  ? colorScheme.primary
                  : colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(16),
                topRight: const Radius.circular(16),
                bottomLeft: Radius.circular(isFromClient ? 16 : 4),
                bottomRight: Radius.circular(isFromClient ? 4 : 16),
              ),
            ),
            child: Text(
              message.text,
              style: 13.w400.copyWith(
                color: isFromClient
                    ? colorScheme.onPrimary
                    : colorScheme.onSurface,
                height: 1.4,
              ),
            ),
          ),
          4.vertSpacing,
          Text(
            message.time,
            style: 10.w400.copyWith(color: colorScheme.onSurfaceVariant),
          ),
        ],
      ),
    );
  }
}
