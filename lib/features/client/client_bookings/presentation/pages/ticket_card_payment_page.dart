import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/client_bookings/presentation/models/ticket_checkout_args.dart';
import 'package:eventra/features/client/client_bookings/presentation/pages/ticket_payment_success_page.dart';
import 'package:eventra/features/client/client_bookings/presentation/widgets/ticket_card_input_field.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/shared/widgets/eventra_buttons/eventra_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart' as intl;

class TicketCardPaymentPage extends StatefulWidget {
  const TicketCardPaymentPage({super.key});

  static const String path = '/ticket-card-payment';
  static const String name = 'ticket-card-payment';

  @override
  State<TicketCardPaymentPage> createState() => TicketCardPaymentPageState();
}

class TicketCardPaymentPageState extends State<TicketCardPaymentPage> {
  final TextEditingController cardNameController = TextEditingController(
    text: 'Paul Ogechukwu',
  );
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController cardExpiryController = TextEditingController();
  final TextEditingController cardCvvController = TextEditingController();

  @override
  void dispose() {
    cardNameController.dispose();
    cardNumberController.dispose();
    cardExpiryController.dispose();
    cardCvvController.dispose();
    super.dispose();
  }

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
          l10n.ticketPayWithCardTitle,
          style: 20.w600.copyWith(color: colorScheme.onSurface),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.ticketCardName,
              style: 18.w500.copyWith(color: colorScheme.onSurface),
            ),
            12.vertSpacing,
            TicketCardInputField(
              controller: cardNameController,
              hint: l10n.ticketCardNameHint,
              keyboardType: TextInputType.name,
            ),
            18.vertSpacing,
            Text(
              l10n.ticketCardNumber,
              style: 18.w500.copyWith(color: colorScheme.onSurface),
            ),
            12.vertSpacing,
            TicketCardInputField(
              controller: cardNumberController,
              hint: l10n.ticketCardNumberHint,
              keyboardType: TextInputType.number,
              maxLength: 19,
            ),
            18.vertSpacing,
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.ticketCardDate,
                        style: 18.w500.copyWith(color: colorScheme.onSurface),
                      ),
                      12.vertSpacing,
                      TicketCardInputField(
                        controller: cardExpiryController,
                        hint: l10n.ticketCardDateHint,
                        keyboardType: TextInputType.datetime,
                        maxLength: 5,
                      ),
                    ],
                  ),
                ),
                16.horizSpacing,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.ticketCardCvv,
                        style: 18.w500.copyWith(color: colorScheme.onSurface),
                      ),
                      12.vertSpacing,
                      TicketCardInputField(
                        controller: cardCvvController,
                        hint: l10n.ticketCardCvvHint,
                        keyboardType: TextInputType.number,
                        maxLength: 3,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
        child: EventraButton(
          buttonText: l10n.ticketPaymentPayButton(totalAmountLabel),
          onPressed: () async {
            await context.pushNamed(
              TicketPaymentSuccessPage.name,
              extra: args,
            );
          },
        ),
      ),
    );
  }
}
