import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/client_bookings/presentation/widgets/ticket_attendee_avatar.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';

class TicketEventAboutSection extends StatelessWidget {
  const TicketEventAboutSection({
    required this.title,
    required this.body,
    required this.goingLabel,
    super.key,
  });

  final String title;
  final String body;
  final String goingLabel;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: 14.w500.copyWith(color: colorScheme.onSurface),
              ),
            ),
            const SizedBox(
              width: 95,
              height: 28,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    child: TicketAttendeeAvatar(
                      imagePath: EventraImages.janeDoe,
                    ),
                  ),
                  Positioned(
                    left: 22,
                    child: TicketAttendeeAvatar(
                      imagePath: EventraImages.johnDoeFour,
                    ),
                  ),
                  Positioned(
                    left: 44,
                    child: TicketAttendeeAvatar(
                      imagePath: EventraImages.johndoesecond,
                    ),
                  ),
                  Positioned(
                    left: 66,
                    child: TicketAttendeeAvatar(
                      imagePath: EventraImages.johndoethree,
                    ),
                  ),
                ],
              ),
            ),
            6.horizSpacing,
            Text(
              goingLabel,
              style: 12.w500.copyWith(color: colorScheme.onSurfaceVariant),
            ),
          ],
        ),
        18.vertSpacing,
        Text(
          body,
          style: 14.w400.copyWith(
            color: colorScheme.onSurfaceVariant,
            height: 1.6,
          ),
        ),
      ],
    );
  }
}
