import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/home/domain/models/vendor.dart';
import 'package:eventra/shared/theme/color_schemes.dart';
import 'package:flutter/material.dart';

class VendorCardWeek extends StatelessWidget {
  const VendorCardWeek({
    required this.vendor,
    super.key,
  });

  final Vendor vendor;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: AppColorSchemes.neutrals0,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(10),
              ),
              child: Image.asset(
                vendor.image,
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 120,
                  width: double.infinity,
                  color: colorScheme.primaryContainer,
                  child: Icon(
                    Icons.image_not_supported_outlined,
                    color: colorScheme.primary,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    vendor.name,
                    style: 14.w400.copyWith(color: colorScheme.onSurface),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                4.vertSpacing,
                Row(
                  children: [
                    Icon(
                      Icons.star_rounded,
                      color: colorScheme.tertiary,
                      size: 16,
                    ),
                    4.horizSpacing,
                    Text(
                      '${vendor.rating}',
                      style: 12.w400.copyWith(color: colorScheme.onSurface),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
