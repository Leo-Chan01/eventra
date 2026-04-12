import 'package:eventra/core/utils/boxshadow_util.dart';
import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/home/domain/models/vendor.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/resources/resources.dart';
import 'package:eventra/shared/widgets/eventra_buttons/eventra_button.dart';
import 'package:flutter/material.dart';

class VendorCardTopRated extends StatelessWidget {
  const VendorCardTopRated({
    required this.vendor,
    this.onViewProfile,
    super.key,
  });

  final Vendor vendor;
  final VoidCallback? onViewProfile;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(10),
        boxShadow: boxShadowLight,
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
                EventraImages.womanWithweddinggown,
                height: 176,
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        vendor.name,
                        style: 16.w500.copyWith(color: colorScheme.onSurface),
                      ),
                      4.vertSpacing,
                      Text(
                        vendor.category,
                        style: 14.w400.copyWith(
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
                            '(${vendor.rating})',
                            style: 14.w500.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                12.horizSpacing,
                Flexible(
                  flex: 2,
                  child: EventraButton.smallBorder(
                    buttonText: context.l10n.homeViewProfile,
                    onPressed: onViewProfile,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
