import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/vendor_details/domain/models/vendor_detail.dart';
import 'package:eventra/features/client/vendor_details/presentation/widgets/related_vendor_card.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:flutter/material.dart';

class RelatedVendorsSection extends StatelessWidget {
  const RelatedVendorsSection({
    required this.vendors,
    required this.onVendorTap,
    super.key,
  });

  final List<RelatedVendor> vendors;
  final ValueChanged<RelatedVendor> onVendorTap;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;

    if (vendors.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.vendorDetailRelatedVendors,
          style: 18.w700.copyWith(
            color: colorScheme.onSurface,
            letterSpacing: 0.5,
          ),
        ),
        12.vertSpacing,
        AspectRatio(
          aspectRatio: 16 / 10,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: vendors.length,
            separatorBuilder: (_, _) => 16.horizSpacing,
            itemBuilder: (context, index) {
              return RelatedVendorCard(
                vendor: vendors[index],
                onTap: () => onVendorTap(vendors[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}
