import 'package:eventra/core/utils/global_snackbar.dart';
import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/client_notification/presentation/bloc/client_notification_bloc.dart';
import 'package:eventra/features/client/client_notification/presentation/widgets/transaction_detail_value_row.dart';
import 'package:eventra/features/client/client_notification/presentation/widgets/transaction_help_card.dart';
import 'package:eventra/features/client/client_notification/presentation/widgets/transaction_section_card.dart';
import 'package:eventra/features/client/client_notification/presentation/widgets/transaction_success_card.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/resources/resources.dart';
import 'package:eventra/shared/theme/color_schemes.dart';
import 'package:eventra/shared/widgets/app_share_bottom_sheet.dart';
import 'package:eventra/shared/widgets/eventra_buttons/eventra_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TransactionDetailsPage extends StatelessWidget {
  const TransactionDetailsPage({super.key});

  static const String path = '/transaction-details';
  static const String name = 'transaction-details';

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;

    return BlocBuilder<ClientNotificationBloc, ClientNotificationState>(
      builder: (context, state) {
        final transaction = state.selectedTransaction;

        return Scaffold(
          backgroundColor: colorScheme.surface,
          appBar: AppBar(
            leading: IconButton(
              onPressed: () => Navigator.of(context).maybePop(),
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
            ),
            title: Text(
              l10n.notificationsTransactionDetailsTitle,
              style: 16.w700.copyWith(color: colorScheme.onSurface),
            ),
            actions: [
              IconButton(
                onPressed: () async {
                  await AppShareBottomSheet.show(
                    context,
                    shareText: '${transaction.vendorName} on Eventra',
                  );
                },
                icon: const Icon(Icons.share_outlined),
              ),
            ],
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    transaction.reference,
                    style: 10.w500.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
                12.vertSpacing,
                TransactionSuccessCard(
                  title: l10n.notificationsPaymentSuccessfulTitle,
                  message: l10n.notificationsPaymentSuccessfulMessage,
                  amount: transaction.plainAmountLabel,
                  dateLabel: transaction.dateLabel,
                ),
                16.vertSpacing,
                TransactionSectionCard(
                  title: l10n.notificationsVendorDetailsTitle,
                  trailing: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: AppColorSchemes.error.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          EventraVectors.outgoingRedIcon,
                        ),
                        Text(
                          l10n.notificationsPaymentSent,
                          style: 10.w700.copyWith(color: AppColorSchemes.error),
                        ),
                      ],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transaction.vendorName,
                        style: 14.w700.copyWith(color: colorScheme.onSurface),
                      ),
                      2.vertSpacing,
                      Text(
                        transaction.category,
                        style: 12.w500.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                      Divider(
                        color: colorScheme.onSurfaceVariant.withValues(
                          alpha: 0.2,
                        ),
                      ),
                      12.vertSpacing,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.email_outlined,
                            size: 16,
                            color: colorScheme.onSurfaceVariant,
                          ),
                          8.horizSpacing,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Email',
                                  style: 11.w500.copyWith(
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                ),
                                Text(
                                  transaction.vendorEmail,
                                  style: 14.w500.copyWith(
                                    color: colorScheme.onSurface,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      8.vertSpacing,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.call_outlined,
                            size: 16,
                            color: colorScheme.onSurfaceVariant,
                          ),
                          8.horizSpacing,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Phone',
                                  style: 11.w500.copyWith(
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                ),
                                Text(
                                  transaction.vendorPhone,
                                  style: 14.w500.copyWith(
                                    color: colorScheme.onSurface,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      8.vertSpacing,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            size: 16,
                            color: colorScheme.onSurfaceVariant,
                          ),
                          8.horizSpacing,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Address',
                                  style: 11.w500.copyWith(
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                ),
                                Text(
                                  transaction.vendorAddress,
                                  style: 14.w500.copyWith(
                                    color: colorScheme.onSurface,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      16.vertSpacing,
                      EventraButton(
                        buttonText: l10n.notificationsContactVendor,
                        isWithIcon: true,
                        icon: EventraVectors.chatBubbleIcon,
                        onPressed: () {
                          GlobalSnackBar.showInfo(
                            l10n.notificationsContactVendorFeedback,
                          );
                        },
                      ),
                    ],
                  ),
                ),
                16.vertSpacing,
                TransactionSectionCard(
                  title: l10n.notificationsEventInformationTitle,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TransactionDetailValueRow(
                        label: l10n.notificationsEventType,
                        value: transaction.eventType,
                      ),
                      10.vertSpacing,
                      TransactionDetailValueRow(
                        label: l10n.notificationsEventDate,
                        value: transaction.eventDate,
                      ),
                      5.vertSpacing,
                      Divider(
                        color: colorScheme.onSurfaceVariant.withValues(
                          alpha: 0.2,
                        ),
                      ),
                      5.vertSpacing,
                      TransactionDetailValueRow(
                        label: l10n.notificationsEventDescription,
                        isVertical: true,
                        value: transaction.description,
                      ),
                    ],
                  ),
                ),
                16.vertSpacing,
                TransactionSectionCard(
                  title: l10n.notificationsPaymentBreakdownTitle,
                  child: Column(
                    children: [
                      TransactionDetailValueRow(
                        label: l10n.notificationsSubtotal,
                        value: _formatAmount(transaction.subtotal),
                      ),
                      10.vertSpacing,
                      TransactionDetailValueRow(
                        label: l10n.notificationsServiceFee,
                        value: _formatAmount(transaction.serviceFee),
                      ),
                      10.vertSpacing,
                      TransactionDetailValueRow(
                        label: l10n.notificationsTax,
                        value: _formatAmount(transaction.tax),
                      ),
                      5.vertSpacing,
                      Divider(
                        color: colorScheme.onSurfaceVariant.withValues(
                          alpha: 0.2,
                        ),
                      ),
                      5.vertSpacing,
                      TransactionDetailValueRow(
                        label: l10n.notificationsTotalAmount,
                        value: transaction.plainAmountLabel,
                        valueColor: colorScheme.primary,
                        isEmphasized: true,
                        isBothEmphashized: true,
                      ),
                    ],
                  ),
                ),
                16.vertSpacing,
                TransactionSectionCard(
                  title: l10n.notificationsPaymentMethodTitle,
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        EventraVectors.creditCardBlueGbIcon,
                      ),
                      12.horizSpacing,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            transaction.paymentSource,
                            style: 13.w700.copyWith(
                              color: colorScheme.onSurface,
                            ),
                          ),
                          2.vertSpacing,
                          Text(
                            l10n.notificationsPrimaryPaymentMethod,
                            style: 11.w500.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                16.vertSpacing,
                TransactionSectionCard(
                  title: l10n.notificationsTransactionReferenceTitle,
                  child: Container(
                    decoration: BoxDecoration(
                      color: colorScheme.onSurfaceVariant.withValues(
                        alpha: 0.03,
                      ),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              transaction.reference,
                              style: 12.w600.copyWith(
                                color: colorScheme.onSurface,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () async {
                              await Clipboard.setData(
                                ClipboardData(text: transaction.reference),
                              );
                              GlobalSnackBar.showSuccess(
                                l10n.notificationsReferenceCopied,
                              );
                            },
                            icon: SvgPicture.asset(
                              EventraVectors.copyIconWhiteBg,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                16.vertSpacing,
                EventraButton.outlined(
                  buttonText: l10n.notificationsDownloadReceipt,
                  isSmallBorderRadius: true,
                  borderRadius: 14,
                  borderColor: colorScheme.outline,
                  textColor: colorScheme.onSurface,
                  onPressed: () {
                    GlobalSnackBar.showInfo(
                      l10n.notificationsReceiptComingSoon,
                    );
                  },
                ),
                16.vertSpacing,
                TransactionHelpCard(
                  title: l10n.notificationsNeedHelpTitle,
                  message: l10n.notificationsNeedHelpMessage,
                  actionLabel: l10n.notificationsContactSupport,
                  onTap: () {
                    GlobalSnackBar.showInfo(
                      l10n.notificationsSupportComingSoon,
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String _formatAmount(double amount) {
    return '₦${amount.toStringAsFixed(0).replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (match) => '${match[1]},',
    )}';
  }
}
