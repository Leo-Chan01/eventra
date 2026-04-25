import 'package:eventra/core/utils/boxshadow_util.dart';
import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/home/domain/models/home_enquiry_status.dart';
import 'package:eventra/features/home/domain/models/vendor.dart';
import 'package:eventra/l10n/gen/app_localizations.dart';
import 'package:eventra/shared/theme/color_schemes.dart';
import 'package:flutter/material.dart';

class VendorBookingVendorCard extends StatelessWidget {
  const VendorBookingVendorCard({
    required this.vendor,
    required this.status,
    required this.dateLabel,
    required this.l10n,
    this.onTap,
    super.key,
  });

  final Vendor vendor;
  final HomeEnquiryStatus status;
  final String dateLabel;
  final AppLocalizations l10n;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final badgeColor = status == HomeEnquiryStatus.pending
        ? AppColorSchemes.warning.withValues(alpha: 0.2)
        : AppColorSchemes.success.withValues(alpha: 0.2);
    final badgeTextColor = status == HomeEnquiryStatus.pending
        ? AppColorSchemes.warning
        : AppColorSchemes.successDark;
    final badgeText = status == HomeEnquiryStatus.active
        ? l10n.homeEnquiryStatusActive
        : status == HomeEnquiryStatus.completed
        ? l10n.notificationsFilterCompleted
        : l10n.notificationsFilterPending;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: BorderRadius.circular(20),
            boxShadow: boxShadowLight,
          ),
          child: Row(
            children: [
              SizedBox(
                width: 70,
                height: 70,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(vendor.image, fit: BoxFit.cover),
                ),
              ),
              16.horizSpacing,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            vendor.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: 16.w700.copyWith(
                              color: colorScheme.onSurface,
                            ),
                          ),
                        ),
                        8.horizSpacing,
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: badgeColor,
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: Text(
                            badgeText,
                            style: 14.w600.copyWith(color: badgeTextColor),
                          ),
                        ),
                      ],
                    ),
                    6.vertSpacing,
                    Text(
                      vendor.category,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: 14.w400.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                    10.vertSpacing,
                    Text(
                      dateLabel,
                      style: 14.w400.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              8.horizSpacing,
              Icon(
                Icons.chevron_right_rounded,
                size: 38,
                color: colorScheme.onSurfaceVariant,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
