import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/vendor_details/domain/models/catalog_item.dart';
import 'package:eventra/features/client/vendor_details/presentation/widgets/vendor_catalog_item_card.dart';
import 'package:flutter/material.dart';

class VendorDetailCatalogTab extends StatelessWidget {
  const VendorDetailCatalogTab({
    required this.items,
    required this.onItemTap,
    super.key,
  });

  final List<CatalogItem> items;
  final ValueChanged<CatalogItem> onItemTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 120),
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: items.length,
        padding: EdgeInsets.zero,
        separatorBuilder: (_, _) => 12.vertSpacing,
        itemBuilder: (context, index) {
          return VendorCatalogItemCard(
            item: items[index],
            onTap: () => onItemTap(items[index]),
          );
        },
      ),
    );
  }
}
