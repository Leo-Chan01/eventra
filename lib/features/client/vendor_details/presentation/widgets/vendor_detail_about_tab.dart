import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/vendor_details/domain/models/vendor_detail.dart';
import 'package:eventra/features/client/vendor_details/presentation/widgets/related_vendors_section.dart';
import 'package:eventra/features/client/vendor_details/presentation/widgets/vendor_service_item.dart';
import 'package:eventra/features/client/vendor_details/presentation/widgets/vendor_trust_section.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/resources/resources.dart';
import 'package:eventra/shared/theme/color_schemes.dart';
import 'package:flutter/material.dart';

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
          Card(
            color: AppColorSchemes.neutrals0,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 16,
              ),
              child: Text(
                vendor.bio,
                style: 15.w500.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  height: 1.5,
                ),
              ),
            ),
          ),
          20.vertSpacing,
          Card(
            color: AppColorSchemes.neutrals0,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.vendorDetailServices,
                    style: 14.w700.copyWith(color: colorScheme.onSurface),
                  ),
                  10.vertSpacing,
                  ...vendor.services.map((s) => VendorServiceItem(label: s)),
                ],
              ),
            ),
          ),
          20.vertSpacing,
          Card(
            color: AppColorSchemes.neutrals0,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 16,
              ),
              child: VendorTrustSection(
                title: l10n.vendorDetailVerificationAndTrust,
                items: [
                  if (vendor.isTopRated)
                    (
                      label: l10n.vendorDetailTopRated,
                      icon: EventraVectors.goodCheckGreen,
                    ),
                  if (vendor.isIdVerified)
                    (
                      label: l10n.vendorDetailIdVerified,
                      icon: EventraVectors.goodCheckGreen,
                    ),
                  if (vendor.isBackgroundChecked)
                    (
                      label: l10n.vendorDetailBackgroundChecked,
                      icon: EventraVectors.goodCheckGreen,
                    ),
                  if (vendor.hasVerificationBadge)
                    (
                      label: l10n.vendorDetailVerificationBadge,
                      icon: EventraVectors.goodCheckGreen,
                    ),
                ],
              ),
            ),
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
