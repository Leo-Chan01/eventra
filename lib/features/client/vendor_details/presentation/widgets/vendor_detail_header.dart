import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/vendor_details/domain/models/vendor_detail.dart';
import 'package:eventra/features/client/vendor_details/presentation/widgets/cover_section.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hugeicons/hugeicons.dart';

class VendorDetailHeader extends StatelessWidget {
  const VendorDetailHeader({
    required this.vendor,
    this.isVendorMode = false,
    super.key,
  });

  final VendorDetail vendor;
  final bool isVendorMode;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CoverSection(vendor: vendor, isVendorMode: isVendorMode),
        18.vertSpacing,
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                spacing: 6,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          vendor.name,
                          style: 22.w600.copyWith(color: colorScheme.onSurface),
                        ),
                        if (vendor.isVerified)
                          SvgPicture.asset(
                            EventraVectors.verify,
                            height: 18,
                            width: 18,
                          ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      HugeIcon(
                        icon: HugeIcons.strokeRoundedLocation01,
                        size: 14,
                        color: colorScheme.onSurfaceVariant,
                      ),
                      4.horizSpacing,
                      Text(
                        vendor.location,
                        style: 12.w400.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                      16.horizSpacing,
                      Icon(
                        Icons.star_rounded,
                        color: colorScheme.tertiary,
                        size: 14,
                      ),
                      4.horizSpacing,
                      Text(
                        '${vendor.rating}',
                        style: 12.w600.copyWith(color: colorScheme.onSurface),
                      ),
                      4.horizSpacing,
                      Text(
                        '(${vendor.reviewsCount})',
                        style: 12.w400.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              8.vertSpacing,
            ],
          ),
        ),
      ],
    );
  }
}
