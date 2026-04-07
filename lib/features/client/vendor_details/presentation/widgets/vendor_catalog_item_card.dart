import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/core/utils/price_formatter.dart';
import 'package:eventra/features/client/vendor_details/domain/models/catalog_item.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class VendorCatalogItemCard extends StatelessWidget {
  const VendorCatalogItemCard({
    required this.item,
    required this.onTap,
    super.key,
  });

  final CatalogItem item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                item.image,
                width: 64,
                height: 64,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  width: 64,
                  height: 64,
                  color: colorScheme.primaryContainer,
                  child: Icon(
                    Icons.image_not_supported_outlined,
                    color: colorScheme.primary,
                  ),
                ),
              ),
            ),
            12.horizSpacing,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: 13.w700.copyWith(color: colorScheme.onSurface),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  4.vertSpacing,
                  Text(
                    item.price.getValue,
                    style: 12.w600.copyWith(color: colorScheme.primary),
                  ),
                  4.vertSpacing,
                  Text(
                    item.description,
                    style: 11.w400.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            8.horizSpacing,
            HugeIcon(
              icon: HugeIcons.strokeRoundedArrowRight01,
              size: 18,
              color: colorScheme.onSurfaceVariant,
            ),
          ],
        ),
      ),
    );
  }
}
