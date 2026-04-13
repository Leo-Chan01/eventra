import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/client_bookings/presentation/models/ticket_checkout_args.dart';
import 'package:eventra/features/client/client_bookings/presentation/models/ticket_event_detail_args.dart';
import 'package:eventra/features/client/client_bookings/presentation/pages/ticket_checkout_page.dart';
import 'package:eventra/features/client/client_bookings/presentation/widgets/ticket_event_about_section.dart';
import 'package:eventra/features/client/client_bookings/presentation/widgets/ticket_event_bottom_bar.dart';
import 'package:eventra/features/client/client_bookings/presentation/widgets/ticket_event_hero_section.dart';
import 'package:eventra/features/client/client_bookings/presentation/widgets/ticket_event_ticket_option_row.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/shared/widgets/app_share_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart' as intl;

class TicketEventDetailPage extends StatefulWidget {
  const TicketEventDetailPage({super.key});

  static const String path = '/ticket-event-detail';
  static const String name = 'ticket-event-detail';

  @override
  State<TicketEventDetailPage> createState() => TicketEventDetailPageState();
}

class TicketEventDetailPageState extends State<TicketEventDetailPage> {
  int regularCount = 3;
  int vvvipCount = 0;

  double get regularPrice => 5000;
  double get vvvipPrice => 20000;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;
    final extra = GoRouterState.of(context).extra;
    if (extra is! TicketEventDetailArgs) {
      return const SizedBox.shrink();
    }
    final args = extra;

    final totalAmount =
        (regularCount * regularPrice) + (vvvipCount * vvvipPrice);
    final localeTag = Localizations.localeOf(context).toLanguageTag();
    final totalAmountLabel = intl.NumberFormat.currency(
      locale: localeTag,
      symbol: '₦',
      decimalDigits: 0,
    ).format(totalAmount);

    return Scaffold(
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            TicketEventHeroSection(
              event: args.event,
              onBack: () => Navigator.of(context).maybePop(),
              onLike: () {},
              onShare: () async {
                await AppShareBottomSheet.show(
                  context,
                  shareText: '${args.event.title} on Eventra',
                );
              },
              eventTagLabel: l10n.ticketEventTag,
            ),
            Positioned(
              bottom: 0,
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width,
                // height: MediaQuery.sizeOf(context).height * 0.50,
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      color: colorScheme.surface,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              25.vertSpacing,
                              TicketEventAboutSection(
                                title: l10n.ticketEventAbout,
                                body: l10n.ticketEventAboutBody,
                                goingLabel: l10n.ticketEventGoing,
                              ),
                              12.vertSpacing,
                              Text(
                                l10n.ticketEventAvailableTicket,
                                style: 14.w600.copyWith(
                                  color: colorScheme.onSurface,
                                ),
                              ),
                              6.vertSpacing,
                              TicketEventTicketOptionRow(
                                ticketName: l10n.ticketDetailRegular,
                                priceLabel: l10n.ticketEventRegularPrice,
                                quantity: regularCount,
                                soldOutLabel: l10n.ticketEventSoldOut,
                                isSoldOut: false,
                                onDecrease: () {
                                  if (regularCount == 0) {
                                    return;
                                  }
                                  setState(() {
                                    regularCount -= 1;
                                  });
                                },
                                onIncrease: () {
                                  setState(() {
                                    regularCount += 1;
                                  });
                                },
                              ),
                              TicketEventTicketOptionRow(
                                ticketName: l10n.ticketEventVip,
                                priceLabel: l10n.ticketEventVipPrice,
                                quantity: 0,
                                soldOutLabel: l10n.ticketEventSoldOut,
                                isSoldOut: true,
                                onDecrease: () {},
                                onIncrease: () {},
                              ),
                              TicketEventTicketOptionRow(
                                ticketName: l10n.ticketEventVvvip,
                                priceLabel: l10n.ticketEventVvvipPrice,
                                quantity: vvvipCount,
                                soldOutLabel: l10n.ticketEventSoldOut,
                                isSoldOut: false,
                                onDecrease: () {
                                  if (vvvipCount == 0) {
                                    return;
                                  }
                                  setState(() {
                                    vvvipCount -= 1;
                                  });
                                },
                                onIncrease: () {
                                  setState(() {
                                    vvvipCount += 1;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: TicketEventBottomBar(
        onBuyTicket: () async {
          final checkoutArgs = TicketCheckoutArgs(
            eventTitle: args.event.title,
            eventImage: args.event.imagePath,
            location: args.event.location,
            eventDate: DateTime(2025, 5, 18, 22),
            ticketType: regularCount > 0
                ? l10n.ticketDetailRegular
                : l10n.ticketEventVvvip,
            ticketQuantity: regularCount > 0 ? regularCount : vvvipCount,
            unitPrice: regularCount > 0 ? regularPrice : vvvipPrice,
            attendeeEmail: l10n.ticketDetailSampleEmail,
            bookingReferenceId: '737367483929210',
          );

          await context.pushNamed(
            TicketCheckoutPage.name,
            extra: checkoutArgs,
          );
        },
        buyTicketLabel: l10n.ticketDetailBuyTicket,
        totalPriceLabel: totalAmountLabel,
      ),
    );
  }
}
