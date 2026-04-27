import 'package:eventra/features/client/vendor_details/domain/models/vendor_detail.dart';
import 'package:eventra/features/client/vendor_details/presentation/widgets/circle_action_button.dart';
import 'package:eventra/features/client/vendor_details/presentation/widgets/profile_avatar.dart';
import 'package:eventra/features/client/vendor_details/presentation/widgets/vendor_tag_chip.dart';
import 'package:eventra/features/home/presentation/models/vendor_edit_profile_page_args.dart';
import 'package:eventra/features/home/presentation/pages/vendor_edit_profile_page.dart';
import 'package:eventra/resources/resources.dart';
import 'package:eventra/shared/widgets/app_share_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CoverSection extends StatelessWidget {
  const CoverSection({
    required this.vendor,
    this.isVendorMode = false,
    super.key,
  });

  final VendorDetail vendor;
  final bool isVendorMode;

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
                    icon: !isVendorMode
                        ? EventraVectors.loveButtonVendorDeets
                        : EventraVectors.settingsButtonVendorDetails,
                    onPressed: () async => Navigator.of(context).maybePop(),
                  ),
                  Row(
                    spacing: 10,
                    children: [
                      if (!isVendorMode)
                        CircleActionButton(
                          icon: EventraVectors.loveVendorDeets,
                          onPressed: () async {
                            await AppShareBottomSheet.show(
                              context,
                              shareText: '${vendor.name} on Eventra',
                            );
                          },
                        ),
                      if (!isVendorMode)
                        CircleActionButton(
                          icon: EventraVectors.shareButtonVendorDeets,
                          onPressed: () async {
                            await AppShareBottomSheet.show(
                              context,
                              shareText: '${vendor.name} on Eventra',
                            );
                          },
                        )
                      else
                        CircleActionButton(
                          icon: EventraVectors.editButtonVendorDetails,
                          onPressed: () async {
                            await context.pushNamed(
                              VendorEditProfilePage.name,
                              extra: VendorEditProfilePageArgs(vendor: vendor),
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
        if (!isVendorMode)
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
              ProfileAvatar(imageUrl: vendor.profileImage),
            ],
          ),
        ),
      ],
    );
  }
}
