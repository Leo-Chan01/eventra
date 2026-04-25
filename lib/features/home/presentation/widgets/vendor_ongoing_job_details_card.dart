import 'package:eventra/core/utils/boxshadow_util.dart';
import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/client_bookings/presentation/widgets/enquiry_flow_detail_row.dart';
import 'package:flutter/material.dart';

class VendorOngoingJobDetailsCard extends StatelessWidget {
  const VendorOngoingJobDetailsCard({
    required this.eventTypeLabel,
    required this.eventDateLabel,
    required this.locationLabel,
    required this.amountPaidLabel,
    required this.dateLabel,
    required this.bookingReferenceLabel,
    required this.inspirationHeader,
    required this.additionalNoteHeader,
    required this.eventType,
    required this.eventDateAndTime,
    required this.location,
    required this.amountPaid,
    required this.date,
    required this.bookingReference,
    required this.inspirationImages,
    required this.additionalNote,
    super.key,
  });

  final String eventTypeLabel;
  final String eventDateLabel;
  final String locationLabel;
  final String amountPaidLabel;
  final String dateLabel;
  final String bookingReferenceLabel;
  final String inspirationHeader;
  final String additionalNoteHeader;
  final String eventType;
  final String eventDateAndTime;
  final String location;
  final String amountPaid;
  final String date;
  final String bookingReference;
  final List<String> inspirationImages;
  final String additionalNote;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: BorderRadius.circular(10),
            boxShadow: boxShadowLight,
          ),
          child: Column(
            children: [
              EnquiryFlowDetailRow(
                label: eventTypeLabel,
                value: eventType,
              ),
              Divider(color: colorScheme.outline.withValues(alpha: 0.2)),
              EnquiryFlowDetailRow(
                label: eventDateLabel,
                value: eventDateAndTime,
              ),
              Divider(color: colorScheme.outline.withValues(alpha: 0.2)),
              EnquiryFlowDetailRow(
                label: locationLabel,
                value: location,
              ),
              Divider(color: colorScheme.outline.withValues(alpha: 0.2)),
              EnquiryFlowDetailRow(
                label: amountPaidLabel,
                value: amountPaid,
                valueColor: colorScheme.primary,
                valueWeight: FontWeight.w700,
              ),
              Divider(color: colorScheme.outline.withValues(alpha: 0.2)),
              EnquiryFlowDetailRow(
                label: dateLabel,
                value: date,
              ),
              Divider(color: colorScheme.outline.withValues(alpha: 0.2)),
              EnquiryFlowDetailRow(
                label: bookingReferenceLabel,
                value: bookingReference,
              ),
            ],
          ),
        ),
        28.vertSpacing,
        Text(
          inspirationHeader,
          style: 14.w600.copyWith(color: colorScheme.onSurface),
        ),
        14.vertSpacing,
        SizedBox(
          height: 112,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: inspirationImages.length,
            separatorBuilder: (_, _) => 10.horizSpacing,
            itemBuilder: (_, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  inspirationImages[index],
                  width: 180,
                  height: 112,
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ),
        28.vertSpacing,
        Text(
          additionalNoteHeader,
          style: 14.w600.copyWith(color: colorScheme.onSurface),
        ),
        14.vertSpacing,
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerLowest,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: colorScheme.outline.withValues(alpha: 0.2),
            ),
          ),
          child: Text(
            additionalNote,
            style: 14.w500.copyWith(color: colorScheme.onSurface),
          ),
        ),
      ],
    );
  }
}
