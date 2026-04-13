import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/client_bookings/presentation/models/ticket_checkout_args.dart';
import 'package:eventra/features/client/client_bookings/presentation/widgets/ticket_payment_success_detail_card.dart';
import 'package:eventra/features/home/presentation/pages/home_page.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/resources/resources.dart';
import 'package:eventra/shared/widgets/eventra_buttons/eventra_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class TicketPaymentSuccessPage extends StatelessWidget {
  const TicketPaymentSuccessPage({super.key});

  static const String path = '/ticket-payment-success';
  static const String name = 'ticket-payment-success';

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;
    final extra = GoRouterState.of(context).extra;
    if (extra is! TicketCheckoutArgs) {
      return const SizedBox.shrink();
    }
    final args = extra;

    return Scaffold(
      backgroundColor: colorScheme.surfaceContainerLow,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
          child: Column(
            children: [
              54.vertSpacing,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  l10n.ticketPaymentSuccessTitle,
                  textAlign: TextAlign.center,
                  style: 20.w500.copyWith(
                    color: colorScheme.onSurface,
                    height: 1.18,
                  ),
                ),
              ),
              28.vertSpacing,
              SizedBox(
                width: 112,
                height: 112,
                child: SvgPicture.asset(
                  EventraVectors.goodCheckGreenDottedCircle,
                ),
              ),
              34.vertSpacing,
              Text(
                l10n.ticketPaymentSuccessBody,
                textAlign: TextAlign.center,
                style: 14.w400.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  height: 1.25,
                ),
              ),
              34.vertSpacing,
              TicketPaymentSuccessDetailCard(args: args),
              const Spacer(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
        child: EventraButton(
          buttonText: l10n.ticketPaymentGoHome,
          onPressed: () {
            context.goNamed(HomePage.name);
          },
        ),
      ),
    );
  }
}
