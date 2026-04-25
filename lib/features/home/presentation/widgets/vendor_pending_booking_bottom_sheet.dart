import 'package:eventra/core/utils/global_snackbar.dart';
import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/client_bookings/presentation/models/enquiry_flow_details_args.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/shared/widgets/eventra_buttons/eventra_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class VendorPendingBookingBottomSheet extends StatelessWidget {
  const VendorPendingBookingBottomSheet({
    required this.args,
    super.key,
  });

  final EnquiryFlowDetailsArgs args;

  static Future<void> show(
    BuildContext context, {
    required EnquiryFlowDetailsArgs args,
  }) async {
    final colorScheme = Theme.of(context).colorScheme;

    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      builder: (_) => VendorPendingBookingBottomSheet(args: args),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;
    final localeTag = Localizations.localeOf(context).toLanguageTag();
    final eventDate = intl.DateFormat.yMMMMEEEEd(
      localeTag,
    ).format(args.eventDate);

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height * 0.92,
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 96,
                  height: 8,
                  decoration: BoxDecoration(
                    color: colorScheme.outline.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
              ),
              16.vertSpacing,
              Row(
                children: [
                  const Spacer(),
                  Text(
                    l10n.enquiryFlowEventDetailsHeader,
                    style: 20.w500.copyWith(color: colorScheme.onSurface),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    child: Icon(
                      Icons.close_rounded,
                      size: 36,
                      color: colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
              20.vertSpacing,
              _detailRow(
                context,
                label: l10n.enquiryFlowEventType,
                value: args.eventType,
              ),
              Divider(
                color: colorScheme.outline.withValues(alpha: 0.24),
                height: 1,
              ),
              _detailRow(
                context,
                label: l10n.enquiryFlowLocation,
                value: args.location,
              ),
              Divider(
                color: colorScheme.outline.withValues(alpha: 0.24),
                height: 1,
              ),
              _detailRow(
                context,
                label: l10n.enquiryFlowDate,
                value: eventDate,
              ),
              Divider(
                color: colorScheme.outline.withValues(alpha: 0.24),
                height: 1,
              ),
              _detailRow(
                context,
                label: l10n.enquiryFlowTime,
                value: args.eventTime,
              ),
              Divider(
                color: colorScheme.outline.withValues(alpha: 0.24),
                height: 1,
              ),
              18.vertSpacing,
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 18,
                ),
                decoration: BoxDecoration(
                  color: colorScheme.surface,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: colorScheme.outline.withValues(alpha: 0.35),
                  ),
                ),
                child: Text(
                  args.deliverables,
                  style: 14.w500.copyWith(color: colorScheme.onSurface),
                ),
              ),
              18.vertSpacing,
              Text(
                l10n.enquiryFlowInspirationHeader,
                style: 14.w600.copyWith(color: colorScheme.onSurfaceVariant),
              ),
              12.vertSpacing,
              SizedBox(
                height: 112,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: args.inspirationImages.length,
                  separatorBuilder: (_, _) => 10.horizSpacing,
                  itemBuilder: (_, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        args.inspirationImages[index],
                        width: 180,
                        height: 112,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
              24.vertSpacing,
              Row(
                children: [
                  Expanded(
                    child: EventraButton(
                      buttonText: l10n.vendorPendingBookingConfirm,
                      onPressed: () {
                        Navigator.of(context).pop();
                        GlobalSnackBar.showInfo(
                          l10n.notificationsActionComingSoon,
                        );
                      },
                    ),
                  ),
                  18.horizSpacing,
                  Expanded(
                    child: EventraButton.outlined(
                      buttonText: l10n.vendorPendingBookingReject,
                      textColor: colorScheme.error,
                      borderColor: colorScheme.error,
                      onPressed: () {
                        Navigator.of(context).pop();
                        GlobalSnackBar.showInfo(
                          l10n.notificationsActionComingSoon,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _detailRow(
    BuildContext context, {
    required String label,
    required String value,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              label,
              style: 14.w400.copyWith(color: colorScheme.onSurfaceVariant),
            ),
          ),
          12.horizSpacing,
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: 16.w400.copyWith(color: colorScheme.onSurface),
            ),
          ),
        ],
      ),
    );
  }
}
