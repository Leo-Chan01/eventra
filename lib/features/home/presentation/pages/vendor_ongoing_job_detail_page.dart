import 'package:eventra/core/utils/global_snackbar.dart';
import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/client_bookings/presentation/models/enquiry_flow_details_args.dart';
import 'package:eventra/features/client/client_bookings/presentation/pages/enquiry_contract_page.dart';
import 'package:eventra/features/home/presentation/widgets/vendor_booking_action_dialog.dart';
import 'package:eventra/features/home/presentation/widgets/vendor_ongoing_job_actions.dart';
import 'package:eventra/features/home/presentation/widgets/vendor_ongoing_job_details_card.dart';
import 'package:eventra/features/home/presentation/widgets/vendor_ongoing_job_header.dart';
import 'package:eventra/features/home/presentation/widgets/vendor_ongoing_job_summary_card.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/shared/theme/color_schemes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart' as intl;

class VendorOngoingJobDetailPage extends StatelessWidget {
  const VendorOngoingJobDetailPage({super.key});

  static const String path = '/vendor-ongoing-job-detail';
  static const String name = 'vendor-ongoing-job-detail';

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final extra = GoRouterState.of(context).extra;
    if (extra is! EnquiryFlowDetailsArgs) {
      return const SizedBox.shrink();
    }
    final args = extra;
    final localeTag = Localizations.localeOf(context).toLanguageTag();
    final dateIssued = intl.DateFormat.yMMMMd(
      localeTag,
    ).format(args.dateIssued);
    final eventDateWithTime =
        '${intl.DateFormat.yMMMMd(localeTag).format(args.eventDate)} | '
        '${args.eventTime}';
    final date = intl.DateFormat.yMMMEd(localeTag).format(args.eventDate);
    final amountPaid = intl.NumberFormat.currency(
      locale: localeTag,
      symbol: '₦',
      decimalDigits: 2,
    ).format(args.amount);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VendorOngoingJobHeader(
                viewReceiptLabel: l10n.vendorOngoingJobViewReceipt,
                onBack: () => Navigator.of(context).maybePop(),
                onViewReceipt: () {
                  GlobalSnackBar.showInfo(l10n.notificationsReceiptComingSoon);
                },
              ),
              14.vertSpacing,
              VendorOngoingJobSummaryCard(
                vendorImage: args.vendor.image,
                vendorName: args.vendor.name,
                invoiceIdLabel:
                    '${l10n.enquiryFlowInvoiceId}: ${args.invoiceId}',
                dateIssuedLabel: '${l10n.enquiryFlowDateIssued}: $dateIssued',
                onMessageVendor: () {
                  GlobalSnackBar.showInfo(
                    l10n.notificationsContactVendorFeedback,
                  );
                },
              ),
              18.vertSpacing,
              VendorOngoingJobDetailsCard(
                eventTypeLabel: l10n.enquiryFlowEventType,
                eventDateLabel: l10n.enquiryReviewEventDate,
                locationLabel: l10n.enquiryFlowLocation,
                amountPaidLabel: l10n.completedEnquiryAmountPaidLabel,
                dateLabel: l10n.completedEnquiryDateLabel,
                bookingReferenceLabel:
                    l10n.completedEnquiryBookingReferenceLabel,
                inspirationHeader: l10n.vendorOngoingJobInspirationHeader,
                additionalNoteHeader: l10n.vendorOngoingJobAdditionalNote,
                eventType: args.eventType,
                eventDateAndTime: eventDateWithTime,
                location: args.location,
                amountPaid: amountPaid,
                date: date,
                bookingReference: args.bookingReferenceId,
                inspirationImages: args.inspirationImages,
                additionalNote: args.deliverables,
              ),
              24.vertSpacing,
              VendorOngoingJobActions(
                viewContractLabel: l10n.enquiryFlowViewContract,
                completeJobLabel: l10n.vendorOngoingJobCompleteJob,
                onViewContract: () async {
                  await context.pushNamed(
                    EnquiryContractPage.name,
                    extra: args,
                  );
                },
                onCompleteJob: () async {
                  await VendorBookingActionDialog.show(
                    context,
                    iconData: Icons.check_rounded,
                    iconColor: AppColorSchemes.success,
                    title: l10n.vendorBookingJobCompletedTitle,
                    subtitle: l10n.vendorBookingJobCompletedSubtitle(
                      args.vendor.name,
                    ),
                    buttonLabel: l10n.vendorBookingDialogOkay,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
