import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/account_type_tracker/presentation/bloc/account_type_tracker_bloc.dart';
import 'package:eventra/features/client/client_bookings/presentation/models/enquiry_flow_details_args.dart';
import 'package:eventra/features/client/client_bookings/presentation/pages/new_invoice_page.dart';
import 'package:eventra/features/client/client_inbox/domain/models/chat_message.dart';
import 'package:eventra/features/client/client_inbox/presentation/bloc/client_inbox_bloc.dart';
import 'package:eventra/features/client/client_inbox/presentation/widgets/chat_bubble.dart';
import 'package:eventra/features/client/client_inbox/presentation/widgets/chat_input_bar.dart';
import 'package:eventra/features/onboarding/onboarding_slides/domain/models/account_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  static const String path = '/chat';
  static const String name = 'chat';

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _inputController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _inputController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (_scrollController.hasClients) {
        await _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final accountType = context
        .read<AccountTypeTrackerBloc>()
        .state
        .selectedAccountType;
    final isVendorMode = accountType == AccountType.vendor;

    return BlocBuilder<ClientInboxBloc, ClientInboxState>(
      builder: (context, state) {
        final thread = state.selectedThread;
        final messages = state.currentMessages;
        final latestEnquiryArgs = _resolveEnquiryFlowArgs(messages);

        return Scaffold(
          backgroundColor: colorScheme.surface,
          appBar: AppBar(
            leading: IconButton(
              onPressed: () => Navigator.of(context).maybePop(),
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
            ),
            title: _ChatAppBarTitle(
              vendorName: thread.vendorName,
              vendorAvatar: thread.vendorAvatar,
              isOnline: thread.isOnline,
            ),
            actions: isVendorMode
                ? [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Center(
                        child: GestureDetector(
                          onTap: () async {
                            final didSendInvoice = await context
                                .pushNamed<bool>(
                                  NewInvoicePage.name,
                                  extra: NewInvoicePageArgs(
                                    bookingId: thread.id,
                                    clientName: thread.vendorName,
                                    clientAvatarPath: thread.vendorAvatar,
                                    eventType:
                                        latestEnquiryArgs?.eventType ?? '',
                                    eventDate:
                                        latestEnquiryArgs?.eventDate ??
                                        DateTime.now(),
                                  ),
                                );

                            if (didSendInvoice == true && context.mounted) {
                              context.read<ClientInboxBloc>().add(
                                InboxInvoiceSent(
                                  enquiryFlowArgs: latestEnquiryArgs,
                                ),
                              );
                              _scrollToBottom();
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: colorScheme.primary,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              'Send Invoice',
                              style: 14.w500.copyWith(
                                color: colorScheme.onPrimary,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]
                : null,
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    return ChatBubble(
                      message: messages[index],
                      isVendorMode: isVendorMode,
                    );
                  },
                ),
              ),
              ChatInputBar(
                controller: _inputController,
                onChanged: (text) {
                  context.read<ClientInboxBloc>().add(
                    InboxInputChanged(text),
                  );
                },
                onSend: () {
                  final text = _inputController.text.trim();
                  if (text.isEmpty) return;
                  context.read<ClientInboxBloc>().add(InboxMessageSent(text));
                  _inputController.clear();
                  _scrollToBottom();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  EnquiryFlowDetailsArgs? _resolveEnquiryFlowArgs(List<ChatMessage> messages) {
    for (final message in messages.reversed) {
      if (message.enquiryFlowArgs != null) {
        return message.enquiryFlowArgs;
      }
    }
    return null;
  }
}

class _ChatAppBarTitle extends StatelessWidget {
  const _ChatAppBarTitle({
    required this.vendorName,
    required this.vendorAvatar,
    required this.isOnline,
  });

  final String vendorName;
  final String vendorAvatar;
  final bool isOnline;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        Stack(
          children: [
            ClipOval(
              child: Image.asset(
                vendorAvatar,
                width: 36,
                height: 36,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) => Container(
                  width: 36,
                  height: 36,
                  color: colorScheme.primaryContainer,
                  child: Icon(
                    Icons.person,
                    color: colorScheme.primary,
                    size: 18,
                  ),
                ),
              ),
            ),
            if (isOnline)
              Positioned(
                bottom: 1,
                right: 1,
                child: Container(
                  width: 9,
                  height: 9,
                  decoration: BoxDecoration(
                    color: const Color(0xFF39C07A),
                    shape: BoxShape.circle,
                    border: Border.all(color: colorScheme.surface, width: 1.5),
                  ),
                ),
              ),
          ],
        ),
        10.horizSpacing,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              vendorName,
              style: 14.w600.copyWith(color: colorScheme.onSurface),
            ),
            if (isOnline)
              Text(
                'Active',
                style: 11.w400,
              ),
          ],
        ),
      ],
    );
  }
}
