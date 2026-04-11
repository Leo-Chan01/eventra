import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/client_bookings/presentation/pages/catalog_item_gallery_page.dart';
import 'package:eventra/features/client/client_bookings/presentation/widgets/catalog_item_thumbnail_strip.dart';
import 'package:eventra/features/client/vendor_details/domain/models/catalog_item.dart';
import 'package:flutter/material.dart';

class CatalogItemDetailHeader extends StatefulWidget {
  const CatalogItemDetailHeader({
    required this.item,
    required this.vendorName,
    super.key,
  });

  final CatalogItem item;
  final String vendorName;

  @override
  State<CatalogItemDetailHeader> createState() =>
      _CatalogItemDetailHeaderState();
}

class _CatalogItemDetailHeaderState extends State<CatalogItemDetailHeader> {
  int _selectedIndex = 0;

  List<String> get _images {
    if (widget.item.images.isNotEmpty) return widget.item.images;
    return [widget.item.image];
  }

  void _onThumbnailTapped(int index) {
    setState(() => _selectedIndex = index);
    _openGallery(index);
  }

  void _openGallery(int index) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => CatalogItemGalleryPage(
          images: _images,
          initialIndex: index,
          title: widget.item.title,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final images = _images;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => _openGallery(_selectedIndex),
          child: SizedBox(
            height: 240,
            width: double.infinity,
            child: Image.asset(
              images[_selectedIndex],
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
        ),
        if (images.length > 1) ...[
          12.vertSpacing,
          CatalogItemThumbnailStrip(
            images: images,
            selectedIndex: _selectedIndex,
            onThumbnailTapped: _onThumbnailTapped,
          ),
        ],
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.vendorName,
                style: 12.w400.copyWith(color: colorScheme.onSurfaceVariant),
              ),
              6.vertSpacing,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      widget.item.title,
                      style: 18.w700.copyWith(color: colorScheme.onSurface),
                    ),
                  ),
                  16.horizSpacing,
                  Text(
                    widget.item.price.getValue,
                    style: 16.w700.copyWith(color: colorScheme.primary),
                  ),
                ],
              ),
              10.vertSpacing,
              Text(
                widget.item.description,
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
