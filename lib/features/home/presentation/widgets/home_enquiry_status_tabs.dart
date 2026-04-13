import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/home/domain/models/home_enquiry_status.dart';
import 'package:flutter/material.dart';

class HomeEnquiryStatusTabs extends StatelessWidget {
  const HomeEnquiryStatusTabs({
    required this.selectedStatus,
    required this.onStatusSelected,
    required this.pendingLabel,
    required this.awaitingPaymentLabel,
    required this.activeLabel,
    required this.completedLabel,
    super.key,
  });

  final HomeEnquiryStatus selectedStatus;
  final ValueChanged<HomeEnquiryStatus> onStatusSelected;
  final String pendingLabel;
  final String awaitingPaymentLabel;
  final String activeLabel;
  final String completedLabel;

  @override
  Widget build(BuildContext context) {
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
          _StatusPill(
            label: pendingLabel,
            isSelected: selectedStatus == HomeEnquiryStatus.pending,
            onTap: () => onStatusSelected(HomeEnquiryStatus.pending),
          ),
          12.horizSpacing,
          _StatusPill(
            label: awaitingPaymentLabel,
            isSelected: selectedStatus == HomeEnquiryStatus.awaitingPayment,
            onTap: () => onStatusSelected(HomeEnquiryStatus.awaitingPayment),
          ),
          12.horizSpacing,
          _StatusPill(
            label: activeLabel,
            isSelected: selectedStatus == HomeEnquiryStatus.active,
            onTap: () => onStatusSelected(HomeEnquiryStatus.active),
          ),
          12.horizSpacing,
          _StatusPill(
            label: completedLabel,
            isSelected: selectedStatus == HomeEnquiryStatus.completed,
            onTap: () => onStatusSelected(HomeEnquiryStatus.completed),
          ),
        ],
      ),
    );
  }
}

class _StatusPill extends StatelessWidget {
  const _StatusPill({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 170),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected
              ? colorScheme.primary
              : colorScheme.onSurfaceVariant.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(16),
          // boxShadow: boxShadowLight,
        ),
        child: Text(
          label,
          style: 14.w500.copyWith(
            color: isSelected
                ? colorScheme.onPrimary
                : colorScheme.onSurfaceVariant,
          ),
        ),
      ),
    );
  }
}
