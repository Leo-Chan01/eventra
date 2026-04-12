import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/client_bookings/presentation/bloc/client_booking_bloc.dart';
import 'package:eventra/features/client/client_bookings/presentation/pages/enquiry_sent_page.dart';
import 'package:eventra/features/client/client_bookings/presentation/widgets/enquiry_flow_vendor_card.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/resources/resources.dart';
import 'package:eventra/shared/widgets/eventra_buttons/eventra_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart' as intl;

class EnquiryReviewPage extends StatelessWidget {
  const EnquiryReviewPage({super.key});

  static const String path = '/enquiry-review';
  static const String name = 'enquiry-review';

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;
    final eventTypeLabels = <String, String>{
      'weddings': l10n.eventTypeWeddings,
      'birthday': l10n.eventTypeBirthday,
      'anniversary': l10n.eventTypeAnniversary,
      'engagement': l10n.eventTypeEngagement,
      'corporate': l10n.eventTypeCorporate,
      'conference': l10n.eventTypeConference,
      'walkathon': l10n.eventTypeWalkathon,
      'other': l10n.eventTypeOther,
    };

    return BlocBuilder<ClientBookingBloc, ClientBookingState>(
      builder: (context, state) {
        final enquiry = state.enquiry;
        final eventDate = enquiry?.eventDate;
        final eventType =
          eventTypeLabels[enquiry?.eventType ?? ''] ??
          (enquiry?.eventType ?? l10n.enquiryFlowSampleEventType);
        final location = (enquiry?.location?.trim().isNotEmpty ?? false)
          ? enquiry!.location!
          : l10n.enquiryFlowSampleLocation;
        final dateLabel = eventDate != null
          ? intl.DateFormat('EEEE, MMMM d, yyyy').format(eventDate)
          : intl.DateFormat('EEEE, MMMM d, yyyy').format(DateTime.now());
        final timeLabel = eventDate != null
          ? intl.DateFormat('h:mm a').format(eventDate)
          : l10n.enquiryFlowSampleTime;

        return Scaffold(
          backgroundColor: colorScheme.surface,
          appBar: AppBar(
            leading: IconButton(
              onPressed: () => Navigator.of(context).maybePop(),
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
            ),
            title: Text(
              l10n.enquiryReviewTitle,
              style: 20.w600.copyWith(color: colorScheme.onSurface),
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 14, 16, 122),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  EnquiryFlowVendorCard.minimal(
                    vendorImage: EventraImages.decoratorPerson,
                    vendorName: state.enquiryVendorName,
                    invoiceIdLabel: '',
                    dateIssuedLabel: '',
                    statusLabel: '',
                    statusValue: '',
                    statusColor: colorScheme.primary,
                    subtitle: state.enquiryCatalogItemTitle,
                    ratingLabel: l10n.enquiryFlowPendingRating('4.8', 342),
                    onMessageVendor: () {},
                  ),
                  18.vertSpacing,
                  Text(
                    l10n.enquiryFlowEventDetailsHeader,
                    style: 14.w600.copyWith(color: colorScheme.onSurface),
                  ),
                  12.vertSpacing,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.enquiryFlowEventType,
                        style: 14.w400.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                      12.horizSpacing,
                      Expanded(
                        child: Text(
                          eventType,
                          textAlign: TextAlign.end,
                          style: 14.w500.copyWith(
                            color: colorScheme.onSurface,
                          ),
                        ),
                      ),
                    ],
                  ),
                  14.vertSpacing,
                  Divider(
                    height: 1,
                    color: colorScheme.outline.withValues(alpha: 0.28),
                  ),
                  14.vertSpacing,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.enquiryFlowLocation,
                        style: 14.w400.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                      12.horizSpacing,
                      Expanded(
                        child: Text(
                          location,
                          textAlign: TextAlign.end,
                          style: 14.w500.copyWith(
                            color: colorScheme.onSurface,
                          ),
                        ),
                      ),
                    ],
                  ),
                  14.vertSpacing,
                  Divider(
                    height: 1,
                    color: colorScheme.outline.withValues(alpha: 0.28),
                  ),
                  14.vertSpacing,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.enquiryFlowDate,
                        style: 14.w400.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                      12.horizSpacing,
                      Expanded(
                        child: Text(
                          dateLabel,
                          textAlign: TextAlign.end,
                          style: 14.w500.copyWith(
                            color: colorScheme.onSurface,
                          ),
                        ),
                      ),
                    ],
                  ),
                  14.vertSpacing,
                  Divider(
                    height: 1,
                    color: colorScheme.outline.withValues(alpha: 0.28),
                  ),
                  14.vertSpacing,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.enquiryFlowTime,
                        style: 14.w400.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                      12.horizSpacing,
                      Expanded(
                        child: Text(
                          timeLabel,
                          textAlign: TextAlign.end,
                          style: 14.w500.copyWith(
                            color: colorScheme.onSurface,
                          ),
                        ),
                      ),
                    ],
                  ),
                  14.vertSpacing,
                  Divider(
                    height: 1,
                    color: colorScheme.outline.withValues(alpha: 0.28),
                  ),
                  22.vertSpacing,
                  Text(
                    l10n.enquiryFlowInspirationHeader,
                    style: 14.w600.copyWith(
                      color: colorScheme.onSurface,
                    ),
                  ),
                  12.vertSpacing,
                  Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            EventraImages.weddingImage,
                            height: 118,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      10.horizSpacing,
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            EventraImages.femaleWeddingPlannerWorkingCeremony1,
                            height: 118,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      10.horizSpacing,
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            EventraImages.decoratorPerson,
                            height: 118,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  8.vertSpacing,
                ],
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 22),
            child: EventraButton(
              buttonText: l10n.enquiryReviewSendButton,
              onPressed: () => _onSendPressed(context),
              width: double.infinity,
            ),
          ),
        );
      },
    );
  }

  Future<void> _onSendPressed(BuildContext context) async {
    final bookingBloc = context.read<ClientBookingBloc>();
    final state = bookingBloc.state;

    bookingBloc.add(
      EnquirySubmitted(
        vendorId: state.enquiryVendorId,
        vendorName: state.enquiryVendorName,
        catalogItemTitle: state.enquiryCatalogItemTitle,
      ),
    );

    await context.pushNamed(EnquirySentPage.name);
  }
}
