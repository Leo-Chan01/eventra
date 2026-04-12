import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/client_inbox/presentation/bloc/client_inbox_bloc.dart';
import 'package:eventra/features/client/client_inbox/presentation/widgets/chat_bubble.dart';
import 'package:eventra/features/client/client_inbox/presentation/widgets/chat_input_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
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

    return BlocBuilder<ClientInboxBloc, ClientInboxState>(
      builder: (context, state) {
        final thread = state.selectedThread;
        final messages = state.currentMessages;

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
                    return ChatBubble(message: messages[index]);
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
