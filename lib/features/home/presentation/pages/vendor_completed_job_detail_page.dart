import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/client_bookings/presentation/models/enquiry_flow_details_args.dart';
import 'package:eventra/features/home/presentation/widgets/vendor_completed_job_info_card.dart';
import 'package:eventra/features/home/presentation/widgets/vendor_completed_job_review_card.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart' as intl;

class VendorCompletedJobDetailPage extends StatelessWidget {
  const VendorCompletedJobDetailPage({super.key});

  static const String path = '/vendor-completed-job-detail';
  static const String name = 'vendor-completed-job-detail';

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;
    final extra = GoRouterState.of(context).extra;
    if (extra is! EnquiryFlowDetailsArgs) {
      return const SizedBox.shrink();
    }
    final args = extra;
    final localeTag = Localizations.localeOf(context).toLanguageTag();
    final eventDateAndTime =
        '${intl.DateFormat.yMMMMd(localeTag).format(args.eventDate)} | '
        '${args.eventTime}';
    final amountPaid = intl.NumberFormat.currency(
      locale: localeTag,
      symbol: '₦',
      decimalDigits: 2,
    ).format(args.amount);

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).maybePop(),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: Text(
          l10n.vendorCompletedJobTitle,
          style: 18.w600.copyWith(color: colorScheme.onSurface),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.vendorCompletedClientInformation,
              style: 16.w600.copyWith(color: colorScheme.onSurface),
            ),
            12.vertSpacing,
            VendorCompletedJobInfoCard(
              rows: [
                VendorCompletedJobInfoCardRowData(
                  label: l10n.vendorCompletedClientFullName,
                  value: l10n.vendorCompletedClientNameSample,
                ),
                VendorCompletedJobInfoCardRowData(
                  label: l10n.vendorCompletedClientPhoneNumber,
                  value: l10n.vendorCompletedClientPhoneSample,
                ),
                VendorCompletedJobInfoCardRowData(
                  label: l10n.vendorCompletedClientEmailAddress,
                  value: l10n.vendorCompletedClientEmailSample,
                ),
              ],
            ),
            22.vertSpacing,
            Text(
              l10n.vendorCompletedEventDetails,
              style: 16.w600.copyWith(color: colorScheme.onSurface),
            ),
            12.vertSpacing,
            VendorCompletedJobInfoCard(
              rows: [
                VendorCompletedJobInfoCardRowData(
                  label: l10n.enquiryFlowEventType,
                  value: args.eventType,
                ),
                VendorCompletedJobInfoCardRowData(
                  label: l10n.enquiryFlowDate,
                  value: eventDateAndTime,
                ),
                VendorCompletedJobInfoCardRowData(
                  label: l10n.enquiryFlowLocation,
                  value: args.location,
                ),
                VendorCompletedJobInfoCardRowData(
                  label: l10n.completedEnquiryAmountPaidLabel,
                  value: amountPaid,
                  isHighlightedValue: true,
                ),
              ],
            ),
            22.vertSpacing,
            VendorCompletedJobReviewCard(
              avatarImage: EventraImages.decoratorPerson,
              reviewerName: l10n.vendorCompletedReviewerName,
              reviewDate: l10n.vendorCompletedReviewDate,
              rating: 3.9,
              reviewBody: l10n.vendorCompletedReviewBody,
            ),
          ],
        ),
      ),
    );
  }
}
