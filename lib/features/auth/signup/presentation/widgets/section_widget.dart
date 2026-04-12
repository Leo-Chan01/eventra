import 'package:eventra/core/utils/boxshadow_util.dart';
import 'package:eventra/core/utils/num_extensions.dart';
import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  const Section({
    required this.title,
    super.key,
    this.content,
    this.items,
    this.itemIcon,
    this.iconSize,
    this.iconColor,
    this.widgetChild,
  });

  final String title;
  final String? content;
  final List<String>? items;
  final IconData? itemIcon;
  final double? iconSize;
  final Color? iconColor;
  final Widget? widgetChild;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.only(top: 12),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        boxShadow: boxShadowLight,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: Text(
              title,
              style: 16.bold.copyWith(color: colorScheme.onSurface),
            ),
          ),
          if (content != null || items != null) ...[
            8.vertSpacing,
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (content != null) ...[
                    Text(
                      content!,
                      style: 14.regular.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        height: 1.5,
                      ),
                    ),
                  ],
                  if (items != null) ...[
                    12.vertSpacing,
                    ...items!.map(
                      (item) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Icon(
                                itemIcon,
                                size: iconSize ?? 16,
                                color:
                                    iconColor ?? colorScheme.onSurfaceVariant,
                              ),
                            ),
                            12.horizSpacing,
                            Expanded(
                              child: Text(
                                item,
                                style: 14.regular.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                  height: 1.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                  if (widgetChild != null) ...[
                    12.vertSpacing,
                    widgetChild!,
                  ],
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
