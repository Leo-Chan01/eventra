import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/vendor_details/domain/models/catalog_item.dart';
import 'package:eventra/features/client/vendor_details/presentation/widgets/vendor_catalog_item_card.dart';
import 'package:eventra/features/client/vendor_details/presentation/widgets/vendor_detail_add_tile.dart';
import 'package:flutter/material.dart';

class VendorDetailCatalogTab extends StatelessWidget {
  const VendorDetailCatalogTab({
    required this.items,
    required this.onItemTap,
    this.isVendorMode = false,
    this.onAddTap,
    super.key,
  });

  final bool isVendorMode;
  final List<CatalogItem> items;
  final ValueChanged<CatalogItem> onItemTap;
  final VoidCallback? onAddTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 120),
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: items.length + (isVendorMode ? 1 : 0),
        padding: EdgeInsets.zero,
        separatorBuilder: (_, _) => 12.vertSpacing,
        itemBuilder: (context, index) {
          if (index == items.length && isVendorMode) {
            return InkWell(
              onTap: onAddTap,
              child: const VendorDetailAddTile(height: 104),
            );
          }
          return VendorCatalogItemCard(
            item: items[index],
            onTap: () => onItemTap(items[index]),
          );
        },
      ),
    );
  }
}
