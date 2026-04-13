import 'package:eventra/core/utils/global_snackbar.dart';
import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/client_bookings/presentation/models/ticket_checkout_args.dart';
import 'package:eventra/features/client/client_bookings/presentation/pages/ticket_card_payment_page.dart';
import 'package:eventra/features/client/client_bookings/presentation/widgets/ticket_checkout_event_summary.dart';
import 'package:eventra/features/client/client_bookings/presentation/widgets/ticket_checkout_payment_method_tile.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/shared/widgets/eventra_buttons/eventra_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart' as intl;

class TicketCheckoutPage extends StatefulWidget {
  const TicketCheckoutPage({super.key});

  static const String path = '/ticket-checkout';
  static const String name = 'ticket-checkout';

  @override
  State<TicketCheckoutPage> createState() => TicketCheckoutPageState();
}

class TicketCheckoutPageState extends State<TicketCheckoutPage> {
  TicketPaymentMethod selectedMethod = TicketPaymentMethod.card;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;
    final extra = GoRouterState.of(context).extra;
    if (extra is! TicketCheckoutArgs) {
      return const SizedBox.shrink();
    }
    final args = extra;
    final localeTag = Localizations.localeOf(context).toLanguageTag();
    final totalAmountLabel = intl.NumberFormat.currency(
      locale: localeTag,
      symbol: '₦',
      decimalDigits: 0,
    ).format(args.totalAmount);

    return Scaffold(
      backgroundColor: colorScheme.surfaceContainerLow,
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        leading: IconButton(
          onPressed: () => Navigator.of(context).maybePop(),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: Text(
          l10n.ticketCheckoutTitle,
          style: 20.w600.copyWith(color: colorScheme.onSurface),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TicketCheckoutEventSummary(args: args),
            20.vertSpacing,
            Divider(color: colorScheme.outline.withValues(alpha: 0.32)),
            18.vertSpacing,
            Row(
              children: [
                Expanded(
                  child: Text(
                    l10n.ticketCheckoutTicketLine(
                      args.ticketType,
                      args.ticketQuantity,
                    ),
                    style: 18.w500.copyWith(color: colorScheme.onSurface),
                  ),
                ),
                Text(
                  totalAmountLabel,
                  style: 20.w700.copyWith(color: colorScheme.onSurface),
                ),
              ],
            ),
            18.vertSpacing,
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
              child: Text(
                l10n.ticketCheckoutEmailLine(args.attendeeEmail),
                style: 18.w400.copyWith(color: colorScheme.primary),
              ),
            ),
            18.vertSpacing,
            TicketCheckoutPaymentMethodTile(
              label: l10n.ticketPaymentMethodCard,
              icon: Icons.credit_card_rounded,
              isSelected: selectedMethod == TicketPaymentMethod.card,
              onTap: () => setState(() {
                selectedMethod = TicketPaymentMethod.card;
              }),
            ),
            TicketCheckoutPaymentMethodTile(
              label: l10n.ticketPaymentMethodTransfer,
              icon: Icons.account_balance_rounded,
              isSelected: selectedMethod == TicketPaymentMethod.transfer,
              onTap: () => setState(() {
                selectedMethod = TicketPaymentMethod.transfer;
              }),
            ),
            TicketCheckoutPaymentMethodTile(
              label: l10n.ticketPaymentMethodUssd,
              icon: Icons.grid_4x4_rounded,
              isSelected: selectedMethod == TicketPaymentMethod.ussd,
              onTap: () => setState(() {
                selectedMethod = TicketPaymentMethod.ussd;
              }),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
        child: EventraButton(
          buttonText: l10n.ticketPaymentPayButton(totalAmountLabel),
          onPressed: () async {
            if (selectedMethod != TicketPaymentMethod.card) {
              GlobalSnackBar.showInfo(l10n.notificationsActionComingSoon);
              return;
            }
            await context.pushNamed(
              TicketCardPaymentPage.name,
              extra: args,
            );
          },
        ),
      ),
    );
  }
}
