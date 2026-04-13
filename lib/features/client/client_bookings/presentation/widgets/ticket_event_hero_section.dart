import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/client_bookings/presentation/widgets/ticket_tag_pill.dart';
import 'package:eventra/features/client/client_bookings/presentation/widgets/ticket_top_circle_button.dart';
import 'package:eventra/features/home/domain/models/home_search_event_item.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TicketEventHeroSection extends StatelessWidget {
  const TicketEventHeroSection({
    required this.event,
    required this.onBack,
    required this.onLike,
    required this.onShare,
    required this.eventTagLabel,
    super.key,
  });

  final HomeSearchEventItem event;
  final VoidCallback onBack;
  final VoidCallback onLike;
  final VoidCallback onShare;
  final String eventTagLabel;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      height: 470,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            event.imagePath,
            fit: BoxFit.cover,
          ),
          Container(
            decoration: BoxDecoration(
              // gradient: LinearGradient(
              //   begin: Alignment.topCenter,
              //   end: Alignment.bottomCenter,
              //   colors: [
              //     colorScheme.surface.withValues(alpha: 0.08),
              //     colorScheme.surface.withValues(alpha: 0.1),
              //     colorScheme.surface.withValues(alpha: 0.6),
              //   ],
              // ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
                child: Row(
                  children: [
                    TicketTopCircleButton(
                      icon: EventraVectors.angleLeftIsolated,
                      onTap: onBack,
                      iconColor: colorScheme.onSurface,
                    ),
                    const Spacer(),
                    TicketTopCircleButton(
                      icon: EventraVectors.heartIsolated,
                      onTap: onLike,
                      iconColor: colorScheme.onSurface,
                    ),
                    10.horizSpacing,
                    TicketTopCircleButton(
                      icon: EventraVectors.shareIconIsolated,
                      onTap: onShare,
                      iconColor: colorScheme.onSurface,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 16,
            right: 16,
            bottom: 24,
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.75,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      TicketTagPill(label: eventTagLabel),
                      8.horizSpacing,
                      TicketTagPill(label: event.category),
                    ],
                  ),
                  16.vertSpacing,
                  Text(
                    event.title,
                    style: 16.w700.copyWith(color: colorScheme.onPrimary),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  12.vertSpacing,
                  Row(
                    children: [
                      SvgPicture.asset(
                        EventraVectors.calendarIcon,
                        width: 16,
                        height: 16,
                        colorFilter: ColorFilter.mode(
                          colorScheme.onPrimary,
                          BlendMode.srcIn,
                        ),
                      ),
                      6.horizSpacing,
                      Text(
                        event.dateTime,
                        style: 10.w500.copyWith(
                          color: colorScheme.onPrimary,
                        ),
                      ),
                    ],
                  ),
                  6.vertSpacing,
                  Row(
                    children: [
                      SvgPicture.asset(
                        EventraVectors.locationPin,
                        width: 16,
                        height: 16,
                        colorFilter: ColorFilter.mode(
                          colorScheme.onPrimary,
                          BlendMode.srcIn,
                        ),
                      ),
                      6.horizSpacing,
                      Expanded(
                        child: Text(
                          event.location,
                          style: 13.w500.copyWith(
                            color: colorScheme.onPrimary,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
