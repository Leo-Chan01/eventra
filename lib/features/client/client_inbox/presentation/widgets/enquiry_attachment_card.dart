import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/vendor_details/domain/models/catalog_item.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:flutter/material.dart';

class EnquiryAttachmentCard extends StatelessWidget {
  const EnquiryAttachmentCard({required this.item, super.key});

  final CatalogItem item;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: MediaQuery.sizeOf(context).width * 0.72,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.35),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              item.image,
              width: 48,
              height: 48,
              fit: BoxFit.cover,
              errorBuilder: (_, _, _) => Container(
                width: 48,
                height: 48,
                color: colorScheme.primaryContainer,
                child: Icon(
                  Icons.image_not_supported,
                  color: colorScheme.primary,
                ),
              ),
            ),
          ),
          10.horizSpacing,
          Expanded(
            child: Text(
              item.title,
              style: 12.w600.copyWith(color: colorScheme.onSurface),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          8.horizSpacing,
          GestureDetector(
            onTap: () {},
            child: Text(
              l10n.chatEnquiryView,
              style: 12.w700.copyWith(color: colorScheme.primary),
            ),
          ),
        ],
      ),
    );
  }
}
