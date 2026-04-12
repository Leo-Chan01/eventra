import 'package:eventra/core/utils/boxshadow_util.dart';
import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/vendor_details/presentation/bloc/vendor_detail_bloc.dart';
import 'package:eventra/features/client/vendor_details/presentation/pages/vendor_detail_page.dart';
import 'package:eventra/features/home/domain/models/vendor.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/shared/widgets/eventra_buttons/eventra_button.dart';
import 'package:eventra/shared/widgets/eventra_buttons/eventra_like_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CategoryVendorCard extends StatelessWidget {
  const CategoryVendorCard({required this.vendor, super.key});

  final Vendor vendor;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(14),
        boxShadow: boxShadowLight,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 343 / 176,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    vendor.image,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => ColoredBox(
                      color: colorScheme.surfaceContainerHighest,
                      child: Icon(
                        Icons.image_outlined,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 12,
                  right: 12,
                  child: EventraLikeButton.blurGlassVersion(
                    isLiked: vendor.isFavorite,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        vendor.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: 16.w600.copyWith(color: colorScheme.onSurface),
                      ),
                      8.vertSpacing,
                      Text(
                        vendor.category,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: 14.w400.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                      10.vertSpacing,
                      Row(
                        children: [
                          Icon(
                            Icons.star_rounded,
                            color: colorScheme.tertiary,
                            size: 18,
                          ),
                          4.horizSpacing,
                          Text(
                            '${vendor.rating} (${vendor.reviewsCount})',
                            style: 14.w500.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                16.horizSpacing,
                EventraButton.smallBorder(
                  width: 112,
                  padding: EdgeInsets.zero,
                  buttonText: context.l10n.homeViewProfile,
                  onPressed: () async {
                    context.read<VendorDetailBloc>().add(
                      VendorSelected(vendor.id),
                    );
                    await context.pushNamed(VendorDetailPage.name);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
