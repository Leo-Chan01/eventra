import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/vendor_details/domain/models/catalog_item.dart';
import 'package:flutter/material.dart';

class CatalogItemDetailHeader extends StatelessWidget {
  const CatalogItemDetailHeader({
    required this.item,
    required this.vendorName,
    super.key,
  });

  final CatalogItem item;
  final String vendorName;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 240,
          width: double.infinity,
          child: Image.asset(
            item.image,
            fit: BoxFit.cover,
            errorBuilder: (_, _, _) => ColoredBox(
              color: colorScheme.primaryContainer,
              child: Icon(
                Icons.image_not_supported_outlined,
                color: colorScheme.primary,
                size: 40,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                vendorName,
                style: 12.w400.copyWith(color: colorScheme.onSurfaceVariant),
              ),
              6.vertSpacing,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      item.title,
                      style: 18.w700.copyWith(color: colorScheme.onSurface),
                    ),
                  ),
                  16.horizSpacing,
                  Text(
                    item.price.getValue,
                    style: 16.w700.copyWith(color: colorScheme.primary),
                  ),
                ],
              ),
              10.vertSpacing,
              Text(
                item.description,
                style: 13.w400.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
