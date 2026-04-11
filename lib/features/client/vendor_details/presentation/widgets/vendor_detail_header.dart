import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/vendor_details/domain/models/vendor_detail.dart';
import 'package:eventra/features/client/vendor_details/presentation/widgets/circle_action_button.dart';
import 'package:eventra/features/client/vendor_details/presentation/widgets/vendor_tag_chip.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:eventra/shared/widgets/app_share_bottom_sheet.dart';
import 'package:hugeicons/hugeicons.dart';

class VendorDetailHeader extends StatelessWidget {
  const VendorDetailHeader({
    required this.vendor,
    super.key,
  });

  final VendorDetail vendor;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _CoverSection(vendor: vendor),
        18.vertSpacing,
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                spacing: 6,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          vendor.name,
                          style: 22.w600.copyWith(color: colorScheme.onSurface),
                        ),
                        if (vendor.isVerified)
                          SvgPicture.asset(
                            EventraVectors.verify,
                            height: 18,
                            width: 18,
                          ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      HugeIcon(
                        icon: HugeIcons.strokeRoundedLocation01,
                        size: 14,
                        color: colorScheme.onSurfaceVariant,
                      ),
                      4.horizSpacing,
                      Text(
                        vendor.location,
                        style: 12.w400.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                      16.horizSpacing,
                      Icon(
                        Icons.star_rounded,
                        color: colorScheme.tertiary,
                        size: 14,
                      ),
                      4.horizSpacing,
                      Text(
                        '${vendor.rating}',
                        style: 12.w600.copyWith(color: colorScheme.onSurface),
                      ),
                      4.horizSpacing,
                      Text(
                        '(${vendor.reviewsCount})',
                        style: 12.w400.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              8.vertSpacing,
            ],
          ),
        ),
      ],
    );
  }
}

class _CoverSection extends StatelessWidget {
  const _CoverSection({required this.vendor});

  final VendorDetail vendor;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          height: 220,
          width: double.infinity,
          child: Image.asset(
            EventraImages.decoratorPerson,
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
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleActionButton(
                    icon: EventraVectors.loveButtonVendorDeets,
                    onPressed: () async => Navigator.of(context).maybePop(),
                  ),
                  Row(
                    spacing: 10,
                    children: [
                      CircleActionButton(
                        icon: EventraVectors.loveVendorDeets,
                        onPressed: () async {
                          await AppShareBottomSheet.show(
                            context,
                            shareText: '${vendor.name} on Eventra',
                          );
                        },
                      ),
                      CircleActionButton(
                        icon: EventraVectors.shareButtonVendorDeets,
                        onPressed: () async {
                          await AppShareBottomSheet.show(
                            context,
                            shareText: '${vendor.name} on Eventra',
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 12,
          right: 16,
          child: Container(
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Wrap(
                children: vendor.tags
                    .map(
                      (tag) => VendorTagChip(
                        label: tag,
                        isLastItem: tag == vendor.tags.last,
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: -30,
          left: 16,
          child: Row(
            children: [
              _ProfileAvatar(imageUrl: vendor.profileImage),
            ],
          ),
        ),
      ],
    );
  }
}

class _ProfileAvatar extends StatelessWidget {
  const _ProfileAvatar({required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: 65,
      height: 65,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: colorScheme.surface, width: 1.5),
        color: colorScheme.primaryContainer,
      ),
      child: ClipOval(
        child: Image.asset(
          imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (_, _, _) => Icon(
            Icons.person_rounded,
            color: colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
