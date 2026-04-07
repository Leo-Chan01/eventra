import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/vendor_details/domain/models/vendor_detail.dart';
import 'package:eventra/features/client/vendor_details/presentation/widgets/vendor_tag_chip.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:share_plus/share_plus.dart';

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
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      vendor.name,
                      style: 18.w700.copyWith(color: colorScheme.onSurface),
                    ),
                  ),
                  if (vendor.isVerified)
                    HugeIcon(
                      icon: HugeIcons.strokeRoundedCheckmarkBadge01,
                      color: colorScheme.primary,
                      size: 20,
                    ),
                ],
              ),
              8.vertSpacing,
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
      children: [
        SizedBox(
          height: 220,
          width: double.infinity,
          child: Image.asset(
            vendor.coverImage,
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
                  _CircleActionButton(
                    icon: HugeIcons.strokeRoundedArrowTurnBackward,
                    onPressed: () async => Navigator.of(context).maybePop(),
                  ),
                  _CircleActionButton(
                    icon: HugeIcons.strokeRoundedShare01,
                    onPressed: () async {
                      await SharePlus.instance.share(
                        ShareParams(text: '${vendor.name} on Eventra'),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 12,
          left: 16,
          child: Row(
            children: [
              _ProfileAvatar(imageUrl: vendor.profileImage),
              12.horizSpacing,
              Wrap(
                spacing: 6,
                children: vendor.tags
                    .map((tag) => VendorTagChip(label: tag))
                    .toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _CircleActionButton extends StatelessWidget {
  const _CircleActionButton({
    required this.icon,
    required this.onPressed,
  });

  final List<List<dynamic>> icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: colorScheme.surface.withValues(alpha: 0.85),
          shape: BoxShape.circle,
        ),
        child: HugeIcon(icon: icon, size: 18, color: colorScheme.onSurface),
      ),
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
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
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
