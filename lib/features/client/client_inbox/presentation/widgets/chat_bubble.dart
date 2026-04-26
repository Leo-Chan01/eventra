import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/client_bookings/presentation/pages/enquiry_invoice_page.dart';
import 'package:eventra/features/client/client_bookings/presentation/pages/pending_enquiry_detail_page.dart';
import 'package:eventra/features/client/client_inbox/domain/models/chat_message.dart';
import 'package:eventra/features/client/client_inbox/presentation/widgets/enquiry_attachment_card.dart';
import 'package:eventra/features/client/client_inbox/presentation/widgets/invoice_attachment_card.dart';
import 'package:eventra/features/home/presentation/widgets/vendor_pending_booking_bottom_sheet.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    required this.message,
    this.isVendorMode = false,
    super.key,
  });

  final ChatMessage message;
  final bool isVendorMode;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;

    final isFromClient = isVendorMode
        ? !message.isFromClient
        : message.isFromClient;

    final timeLabel = Text(
      message.time,
      style: 10.w400.copyWith(color: colorScheme.onSurfaceVariant),
    );

    switch (message.type) {
      case ChatMessageType.statusInReview:
      case ChatMessageType.statusConfirmed:
        if (isVendorMode) {
          return const SizedBox.shrink();
        }
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.sizeOf(context).width * 0.7,
                  ),
                  child: Text(
                    message.text,
                    textAlign: TextAlign.center,
                    style: 16.w400.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      height: 1.5,
                    ),
                  ),
                ),
                if (message.showStatusAction) ...[
                  10.vertSpacing,
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: colorScheme.surface,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: colorScheme.outline,
                        width: 0.8,
                      ),
                    ),
                    child: Text(
                      l10n.enquirySentViewProfile,
                      style: 14.w400.copyWith(color: colorScheme.onSurface),
                    ),
                  ),
                ],
              ],
            ),
          ),
        );

      case ChatMessageType.invoice:
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Column(
            crossAxisAlignment: isFromClient
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: [
              Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.sizeOf(context).width * 0.72,
                ),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: colorScheme.primary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: InvoiceAttachmentCard(
                  onTap: () async {
                    if (message.enquiryFlowArgs != null) {
                      await context.pushNamed(
                        EnquiryInvoicePage.name,
                        extra: message.enquiryFlowArgs,
                      );
                    }
                  },
                ),
              ),
              4.vertSpacing,
              timeLabel,
            ],
          ),
        );

      case ChatMessageType.enquiry:
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Column(
            crossAxisAlignment: isFromClient
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: [
              Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.sizeOf(context).width * 0.72,
                ),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: colorScheme.primary,
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(8),
                    topRight: const Radius.circular(8),
                    bottomLeft: const Radius.circular(8),
                    bottomRight: Radius.circular(isFromClient ? 8 : 0),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    EnquiryAttachmentCard(
                      item: message.enquiryAttachment,
                      title: message.enquiryAttachment == null
                          ? l10n.chatEnquiry
                          : null,
                      showThumbnail: message.enquiryAttachment != null,
                      onTap: () async {
                        if (message.enquiryFlowArgs != null) {
                          if (isVendorMode) {
                            await VendorPendingBookingBottomSheet.show(
                              context,
                              args: message.enquiryFlowArgs!,
                            );
                          } else {
                            await context.pushNamed(
                              PendingEnquiryDetailPage.name,
                              extra: message.enquiryFlowArgs,
                            );
                          }
                        }
                      },
                    ),
                    8.vertSpacing,
                    Text(
                      message.text,
                      style: 16.w400.copyWith(
                        color: colorScheme.onPrimary,
                        height: 1.35,
                      ),
                    ),
                  ],
                ),
              ),
              4.vertSpacing,
              timeLabel,
            ],
          ),
        );

      case ChatMessageType.text:
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Column(
            crossAxisAlignment: isFromClient
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: [
              Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.sizeOf(context).width * 0.72,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: isFromClient
                      ? colorScheme.primary
                      : colorScheme.surfaceContainerHighest.withValues(
                          alpha: 0.3,
                        ),
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(16),
                    topRight: const Radius.circular(16),
                    bottomLeft: Radius.circular(isFromClient ? 16 : 0),
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
              timeLabel,
            ],
          ),
        );
    }
  }
}
