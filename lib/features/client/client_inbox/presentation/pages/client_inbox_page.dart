import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/client_inbox/presentation/bloc/client_inbox_bloc.dart';
import 'package:eventra/features/client/client_inbox/presentation/pages/chat_page.dart';
import 'package:eventra/features/client/client_inbox/presentation/widgets/inbox_search_bar.dart';
import 'package:eventra/features/client/client_inbox/presentation/widgets/message_thread_card.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ClientInboxPage extends StatefulWidget {
  const ClientInboxPage({super.key});

  static const String path = '/client-inbox';
  static const String name = 'client-inbox';

  @override
  State<ClientInboxPage> createState() => _ClientInboxPageState();
}

class _ClientInboxPageState extends State<ClientInboxPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;

    return BlocBuilder<ClientInboxBloc, ClientInboxState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: colorScheme.surface,
          appBar: AppBar(
            leading: IconButton(
              onPressed: () => Navigator.of(context).maybePop(),
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
            ),
            title: Text(
              l10n.inboxTitle,
              style: 18.w700.copyWith(color: colorScheme.onSurface),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: Column(
              children: [
                InboxSearchBar(
                  controller: _searchController,
                  onChanged: (query) {
                    context.read<ClientInboxBloc>().add(
                      InboxSearchChanged(query),
                    );
                  },
                ),
                34.vertSpacing,
                Expanded(
                  child: state.visibleThreads.isEmpty
                      ? Center(
                          child: Text(
                            l10n.inboxNoMessages,
                            style: 14.w400.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                        )
                      : ListView.builder(
                          itemCount: state.visibleThreads.length,
                          itemBuilder: (context, index) {
                            final thread = state.visibleThreads[index];
                            return Column(
                              children: [
                                MessageThreadCard(
                                  thread: thread,
                                  onTap: () async {
                                    context.read<ClientInboxBloc>().add(
                                      InboxThreadSelected(thread.id),
                                    );
                                    await context.pushNamed(ChatPage.name);
                                  },
                                ),
                                if (index < state.visibleThreads.length - 1)
                                  Divider(
                                    color: colorScheme.outlineVariant
                                        .withValues(alpha: 0.1),
                                    height: 1,
                                  ),
                              ],
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
