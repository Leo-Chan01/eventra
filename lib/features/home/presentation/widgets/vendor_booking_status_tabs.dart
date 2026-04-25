import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/home/presentation/models/vendor_booking_filter_type.dart';
import 'package:eventra/l10n/gen/app_localizations.dart';
import 'package:flutter/material.dart';

class VendorBookingStatusTabs extends StatelessWidget {
  const VendorBookingStatusTabs({
    required this.selectedFilter,
    required this.onFilterSelected,
    required this.l10n,
    super.key,
  });

  final VendorBookingFilterType selectedFilter;
  final ValueChanged<VendorBookingFilterType> onFilterSelected;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final calculatedHeight = MediaQuery.sizeOf(context).height * 0.05;
    final tabBarHeight = calculatedHeight < 48
        ? 48.0
        : (calculatedHeight > 56 ? 56.0 : calculatedHeight);

    return SizedBox(
      height: tabBarHeight,
      child: ListView(
        key: const Key('home_enquiry_status_list'),
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(vertical: 2),
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () => onFilterSelected(VendorBookingFilterType.all),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 170),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                color: selectedFilter == VendorBookingFilterType.all
                    ? colorScheme.primary
                    : colorScheme.onSurfaceVariant.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                l10n.vendorBookingsFilterAll,
                style: 14.w500.copyWith(
                  color: selectedFilter == VendorBookingFilterType.all
                      ? colorScheme.onPrimary
                      : colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ),
          12.horizSpacing,
          InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () => onFilterSelected(VendorBookingFilterType.pending),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 170),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                color: selectedFilter == VendorBookingFilterType.pending
                    ? colorScheme.primary
                    : colorScheme.onSurfaceVariant.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                l10n.notificationsFilterPending,
                style: 14.w500.copyWith(
                  color: selectedFilter == VendorBookingFilterType.pending
                      ? colorScheme.onPrimary
                      : colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ),
          12.horizSpacing,
          InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () => onFilterSelected(VendorBookingFilterType.active),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 170),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                color: selectedFilter == VendorBookingFilterType.active
                    ? colorScheme.primary
                    : colorScheme.onSurfaceVariant.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                l10n.homeEnquiryStatusActive,
                style: 14.w500.copyWith(
                  color: selectedFilter == VendorBookingFilterType.active
                      ? colorScheme.onPrimary
                      : colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ),
          12.horizSpacing,
          InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () => onFilterSelected(VendorBookingFilterType.completed),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 170),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                color: selectedFilter == VendorBookingFilterType.completed
                    ? colorScheme.primary
                    : colorScheme.onSurfaceVariant.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                l10n.notificationsFilterCompleted,
                style: 14.w500.copyWith(
                  color: selectedFilter == VendorBookingFilterType.completed
                      ? colorScheme.onPrimary
                      : colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
