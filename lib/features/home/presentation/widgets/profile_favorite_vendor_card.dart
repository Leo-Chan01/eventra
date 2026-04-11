import 'package:eventra/core/utils/boxshadow_util.dart';
import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/home/domain/models/vendor.dart';
import 'package:eventra/resources/resources.dart';
import 'package:eventra/shared/widgets/eventra_buttons/eventra_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileFavoriteVendorCard extends StatelessWidget {
  const ProfileFavoriteVendorCard({
    required this.vendor,
    required this.removeLabel,
    required this.viewProfileLabel,
    required this.onRemove,
    required this.onViewProfile,
    super.key,
  });

  final Vendor vendor;
  final String removeLabel;
  final String viewProfileLabel;
  final VoidCallback onRemove;
  final VoidCallback onViewProfile;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(24),
        boxShadow: boxShadowLight,
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Image.asset(
                    vendor.image,
                    width: 126,
                    height: 118,
                    fit: BoxFit.cover,
                  ),
                ),
                14.horizSpacing,
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          vendor.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: 16.w600.copyWith(color: colorScheme.onSurface),
                        ),
                        8.vertSpacing,
                        Text(
                          vendor.category,
                          style: 14.w400.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                        12.vertSpacing,
                        Row(
                          children: [
                            SvgPicture.asset(
                              EventraVectors.starVector,
                              width: 16,
                              height: 16,
                            ),
                            8.horizSpacing,
                            Expanded(
                              child: Text(
                                '${vendor.rating.toStringAsFixed(1)}'
                                ' (${vendor.reviewsCount}) Reviews',
                                style: 13.w400.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          standardDividerUtil(context),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
            child: Row(
              children: [
                InkWell(
                  onTap: onRemove,
                  child: Text(
                    removeLabel,
                    style: 15.w600.copyWith(color: colorScheme.primary),
                  ),
                ),
                const Spacer(),
                EventraButton.smallBorder(
                  buttonText: viewProfileLabel,
                  width: 132,
                  height: 44,
                  onPressed: onViewProfile,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
