import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/vendor_details/domain/models/catalog_item.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:flutter/material.dart';

class EnquiryAttachmentCard extends StatelessWidget {
  const EnquiryAttachmentCard({
    required this.onTap,
    this.item,
    this.title,
    this.showThumbnail = true,
    super.key,
  });

  final VoidCallback onTap;
  final CatalogItem? item;
  final String? title;
  final bool showThumbnail;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;

    final resolvedTitle = title ?? item?.title ?? l10n.chatEnquiry;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          if (showThumbnail && item != null) ...[
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(
                item!.image,
                width: 28,
                height: 28,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) => Container(
                  width: 28,
                  height: 28,
                  color: colorScheme.primaryContainer,
                  child: Icon(
                    Icons.image_not_supported,
                    color: colorScheme.primary,
                    size: 16,
                  ),
                ),
              ),
            ),
            8.horizSpacing,
          ],
          Expanded(
            child: Text(
              resolvedTitle,
              style: 12.w500.copyWith(color: colorScheme.onSurface),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          8.horizSpacing,
          GestureDetector(
            onTap: onTap,
            child: Text(
              l10n.chatEnquiryView,
              style: 12.w400.copyWith(color: colorScheme.primary),
            ),
          ),
        ],
      ),
    );
  }
}
