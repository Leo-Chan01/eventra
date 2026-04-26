import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/client_inbox/presentation/bloc/client_inbox_bloc.dart';
import 'package:eventra/features/client/client_inbox/presentation/pages/chat_page.dart';
import 'package:eventra/features/client/client_inbox/presentation/widgets/inbox_search_bar.dart';
import 'package:eventra/features/client/client_inbox/presentation/widgets/message_thread_card.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class VendorInboxTab extends StatefulWidget {
  const VendorInboxTab({super.key});

  @override
  State<VendorInboxTab> createState() => _VendorInboxTabState();
}

class _VendorInboxTabState extends State<VendorInboxTab> {
  final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final l10n = context.l10n;

    return BlocBuilder<ClientInboxBloc, ClientInboxState>(
      builder: (context, state) {
        return Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.inboxTitle,
                    style: 24.w500.copyWith(color: colorScheme.onSurface),
                  ),
                  18.vertSpacing,
                  InboxSearchBar(
                    controller: searchController,
                    hintText: l10n.navSearch,
                    showFilter: false,
                    onChanged: (query) {
                      context.read<ClientInboxBloc>().add(
                        InboxSearchChanged(query),
                      );
                    },
                  ),
                  18.vertSpacing,
                  Expanded(
                    child: ListView.separated(
                      itemCount: state.visibleThreads.length,
                      separatorBuilder: (_, _) => Divider(
                        height: 1,
                        thickness: 1,
                        color: colorScheme.outlineVariant.withValues(
                          alpha: 0.2,
                        ),
                      ),
                      itemBuilder: (context, index) {
                        final thread = state.visibleThreads[index];
                        return MessageThreadCard(
                          thread: thread,
                          onTap: () async {
                            context.read<ClientInboxBloc>().add(
                              InboxThreadSelected(thread.id),
                            );
                            await context.pushNamed(ChatPage.name);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 16,
              bottom: 22,
              child: SizedBox(
                width: 52,
                height: 52,
                child: FloatingActionButton(
                  elevation: 0,
                  backgroundColor: colorScheme.primary,
                  onPressed: () {},
                  child: Icon(
                    Icons.add,
                    size: 32,
                    color: colorScheme.onPrimary,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
