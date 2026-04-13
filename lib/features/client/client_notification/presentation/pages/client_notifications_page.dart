import 'package:eventra/core/utils/global_snackbar.dart';
import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/client_notification/presentation/bloc/client_notification_bloc.dart';
import 'package:eventra/features/client/client_notification/presentation/pages/transaction_details_page.dart';
import 'package:eventra/features/client/client_notification/presentation/pages/transaction_history_page.dart';
import 'package:eventra/features/client/client_notification/presentation/widgets/notification_list_card.dart';
import 'package:eventra/features/client/client_notification/presentation/widgets/notification_tab_switcher.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ClientNotificationsPage extends StatelessWidget {
  const ClientNotificationsPage({super.key});

  static const String path = '/client-notifications';
  static const String name = 'client-notifications';

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;

    return BlocBuilder<ClientNotificationBloc, ClientNotificationState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: colorScheme.surface,
          appBar: AppBar(
            leading: IconButton(
              onPressed: () => Navigator.of(context).maybePop(),
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
            ),
            title: Text(
              l10n.notificationsTitle,
              style: 16.w700.copyWith(color: colorScheme.onSurface),
            ),
            actions: [
              IconButton(
                onPressed: () async {
                  await context.pushNamed(TransactionHistoryPage.name);
                },
                icon: const Icon(Icons.settings_outlined),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: Column(
              children: [
                NotificationTabSwitcher(
                  selectedTab: state.notificationTab,
                  allCountLabel: l10n.notificationsAllCount(
                    state.notifications.length,
                  ),
                  unreadCountLabel: l10n.notificationsUnreadCount(
                    state.unreadCount,
                  ),
                  onChanged: (value) {
                    context.read<ClientNotificationBloc>().add(
                      NotificationTabChanged(value),
                    );
                  },
                ),
                16.vertSpacing,
                Expanded(
                  child: state.visibleNotifications.isEmpty
                      ? Center(
                          child: Image.asset(
                            EventraImages.transactionHistoryNotificationEmpty,
                            width: 240,
                            fit: BoxFit.contain,
                          ),
                        )
                      : ListView.separated(
                          itemCount: state.visibleNotifications.length,
                          separatorBuilder: (_, _) => 10.vertSpacing,
                          itemBuilder: (context, index) {
                            final notification =
                                state.visibleNotifications[index];

                            return NotificationListCard(
                              notification: notification,
                              onPressed: () async {
                                if (notification.opensTransaction) {
                                  context.read<ClientNotificationBloc>().add(
                                    TransactionSelected(
                                      notification.transactionId!,
                                    ),
                                  );
                                  await context.pushNamed(
                                    TransactionDetailsPage.name,
                                  );
                                  return;
                                }

                                GlobalSnackBar.showInfo(
                                  l10n.notificationsActionComingSoon,
                                );
                              },
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
