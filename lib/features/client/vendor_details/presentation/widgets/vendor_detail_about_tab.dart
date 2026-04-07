import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/vendor_details/domain/models/vendor_detail.dart';
import 'package:eventra/features/client/vendor_details/presentation/widgets/related_vendors_section.dart';
import 'package:eventra/features/client/vendor_details/presentation/widgets/vendor_service_item.dart';
import 'package:eventra/features/client/vendor_details/presentation/widgets/vendor_trust_section.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class VendorDetailAboutTab extends StatelessWidget {
  const VendorDetailAboutTab({
    required this.vendor,
    required this.onRelatedVendorTap,
    super.key,
  });

  final VendorDetail vendor;
  final ValueChanged<RelatedVendor> onRelatedVendorTap;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 120),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            vendor.bio,
            style: 13.w400.copyWith(
              color: colorScheme.onSurfaceVariant,
              height: 1.5,
            ),
          ),
          20.vertSpacing,
          Text(
            l10n.vendorDetailServices,
            style: 14.w700.copyWith(color: colorScheme.onSurface),
          ),
          10.vertSpacing,
          ...vendor.services.map((s) => VendorServiceItem(label: s)),
          20.vertSpacing,
          VendorTrustSection(
            title: l10n.vendorDetailVerificationAndTrust,
            items: [
              if (vendor.isTopRated)
                (
                  label: l10n.vendorDetailTopRated,
                  icon: HugeIcons.strokeRoundedStar,
                ),
              if (vendor.isIdVerified)
                (
                  label: l10n.vendorDetailIdVerified,
                  icon: HugeIcons.strokeRoundedIdentification,
                ),
              if (vendor.isBackgroundChecked)
                (
                  label: l10n.vendorDetailBackgroundChecked,
                  icon: HugeIcons.strokeRoundedCheckmarkBadge01,
                ),
              if (vendor.hasVerificationBadge)
                (
                  label: l10n.vendorDetailVerificationBadge,
                  icon: HugeIcons.strokeRoundedAward01,
                ),
            ],
          ),
          24.vertSpacing,
          RelatedVendorsSection(
            vendors: vendor.relatedVendors,
            onVendorTap: onRelatedVendorTap,
          ),
        ],
      ),
    );
  }
}
