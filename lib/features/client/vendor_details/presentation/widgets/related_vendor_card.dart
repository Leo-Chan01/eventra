import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/vendor_details/domain/models/vendor_detail.dart';
import 'package:flutter/material.dart';

class RelatedVendorCard extends StatelessWidget {
  const RelatedVendorCard({
    required this.vendor,
    required this.onTap,
    super.key,
  });

  final RelatedVendor vendor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                vendor.image,
                width: 100,
                height: 80,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) => Container(
                  width: 100,
                  height: 80,
                  decoration: BoxDecoration(
                    color: colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.image_not_supported_outlined,
                    color: colorScheme.primary,
                  ),
                ),
              ),
            ),
            8.vertSpacing,
            Text(
              vendor.name,
              style: 12.w600.copyWith(color: colorScheme.onSurface),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            2.vertSpacing,
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Text(
                    vendor.category,
                    style: 9.w500.copyWith(color: colorScheme.primary),
                  ),
                ),
              ],
            ),
            4.vertSpacing,
            Text(
              vendor.location,
              style: 10.w400.copyWith(color: colorScheme.onSurfaceVariant),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
