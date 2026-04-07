import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/home/domain/models/vendor.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/shared/widgets/eventra_buttons/eventra_button.dart';
import 'package:flutter/material.dart';

class VendorCardTopRated extends StatelessWidget {
  const VendorCardTopRated({
    required this.vendor,
    super.key,
  });

  final Vendor vendor;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
            child: Image.asset(
              vendor.image,
              height: 176,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        vendor.name,
                        style: 18.w700.copyWith(color: colorScheme.onSurface),
                      ),
                      4.vertSpacing,
                      Text(
                        vendor.location,
                        style: 13.w400.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                      8.vertSpacing,
                      Row(
                        children: [
                          Icon(
                            Icons.star_rounded,
                            color: colorScheme.tertiary,
                            size: 18,
                          ),
                          4.horizSpacing,
                          Text(
                            '${vendor.rating} • ${vendor.category}',
                            style: 13.w500.copyWith(
                              color: colorScheme.onSurface,
                            ),
                          ),
                        ],
                      ),
                      6.vertSpacing,
                      Text(
                        vendor.startingPrice.getValue,
                        style: 13.w700.copyWith(color: colorScheme.primary),
                      ),
                    ],
                  ),
                ),
                12.horizSpacing,
                EventraButton(
                  buttonText: context.l10n.homeViewProfile,
                  width: 110,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
