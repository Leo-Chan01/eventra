import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/client_notification/domain/models/transaction_record.dart';
import 'package:eventra/features/client/client_notification/presentation/bloc/client_notification_bloc.dart';
import 'package:eventra/features/client/client_notification/presentation/pages/transaction_details_page.dart';
import 'package:eventra/features/client/client_notification/presentation/widgets/transaction_filter_chip.dart';
import 'package:eventra/features/client/client_notification/presentation/widgets/transaction_list_item.dart';
import 'package:eventra/features/client/client_notification/presentation/widgets/transaction_search_field.dart';
import 'package:eventra/features/client/client_notification/presentation/widgets/transaction_summary_card.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class TransactionHistoryPage extends StatelessWidget {
  const TransactionHistoryPage({super.key});

  static const String path = '/transaction-history';
  static const String name = 'transaction-history';

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
              l10n.notificationsTransactionHistoryTitle,
              style: 16.w700.copyWith(color: colorScheme.onSurface),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TransactionSearchField(
                  hintText: l10n.notificationsSearchTransactionsHint,
                  onChanged: (value) {
                    context.read<ClientNotificationBloc>().add(
                      TransactionSearchChanged(value),
                    );
                  },
                ),
                12.vertSpacing,
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      TransactionFilterChip(
                        label: l10n.notificationsFilterAll,
                        isSelected:
                            state.transactionFilter == TransactionFilter.all,
                        onTap: () {
                          context.read<ClientNotificationBloc>().add(
                            const TransactionFilterChanged(
                              TransactionFilter.all,
                            ),
                          );
                        },
                      ),
                      8.horizSpacing,
                      TransactionFilterChip(
                        label: l10n.notificationsFilterCompleted,
                        isSelected:
                            state.transactionFilter ==
                            TransactionFilter.completed,
                        onTap: () {
                          context.read<ClientNotificationBloc>().add(
                            const TransactionFilterChanged(
                              TransactionFilter.completed,
                            ),
                          );
                        },
                      ),
                      8.horizSpacing,
                      TransactionFilterChip(
                        label: l10n.notificationsFilterPending,
                        isSelected:
                            state.transactionFilter ==
                            TransactionFilter.pending,
                        onTap: () {
                          context.read<ClientNotificationBloc>().add(
                            const TransactionFilterChanged(
                              TransactionFilter.pending,
                            ),
                          );
                        },
                      ),
                      8.horizSpacing,
                      TransactionFilterChip(
                        label: l10n.notificationsFilterFailed,
                        isSelected:
                            state.transactionFilter == TransactionFilter.failed,
                        onTap: () {
                          context.read<ClientNotificationBloc>().add(
                            const TransactionFilterChanged(
                              TransactionFilter.failed,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                16.vertSpacing,
                Row(
                  children: [
                    TransactionSummaryCard(
                      label: l10n.notificationsTotalSpent,
                      amount: _formatCurrency(state.totalSpent),
                    ),
                    10.horizSpacing,
                    TransactionSummaryCard(
                      label: l10n.notificationsTotalRefunds,
                      amount: _formatCurrency(state.totalRefunds),
                    ),
                  ],
                ),
                16.vertSpacing,
                Text(
                  l10n.notificationsRecentTransactions,
                  style: 11.w700.copyWith(color: colorScheme.onSurfaceVariant),
                ),
                8.vertSpacing,
                Expanded(
                  child: ListView.separated(
                    itemCount: state.visibleTransactions.length,
                    separatorBuilder: (_, _) => 12.vertSpacing,
                    itemBuilder: (context, index) {
                      final transaction = state.visibleTransactions[index];

                      return TransactionListItem(
                        transaction: transaction,
                        statusLabel: _statusLabel(l10n, transaction.status),
                        onTap: () async {
                          context.read<ClientNotificationBloc>().add(
                            TransactionSelected(transaction.id),
                          );
                          await context.pushNamed(TransactionDetailsPage.name);
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

  String _formatCurrency(double amount) {
    final formatter = NumberFormat.currency(symbol: '₦', decimalDigits: 0);
    return formatter.format(amount);
  }

  String _statusLabel(AppLocalizations l10n, TransactionStatus status) {
    return switch (status) {
      TransactionStatus.completed => l10n.notificationsFilterCompleted,
      TransactionStatus.pending => l10n.notificationsFilterPending,
      TransactionStatus.failed => l10n.notificationsFilterFailed,
    };
  }
}
