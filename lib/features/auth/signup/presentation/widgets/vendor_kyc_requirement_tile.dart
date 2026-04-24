import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/auth/signup/presentation/widgets/vendor_kyc_loading_indicator.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VendorKycRequirementTile extends StatelessWidget {
  const VendorKycRequirementTile({
    required this.title,
    required this.leadingIcon,
    this.isLoading = false,
    this.isSelected = false,
    this.onTap,
    super.key,
  });

  final String title;
  final String leadingIcon;
  final bool isLoading;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected
                ? colorScheme.primary
                : colorScheme.outline.withValues(alpha: 0.2),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: colorScheme.surface,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: SvgPicture.asset(
                leadingIcon,
                width: 18,
                height: 18,
                colorFilter: ColorFilter.mode(
                  colorScheme.primary,
                  BlendMode.srcIn,
                ),
              ),
            ),
            16.horizSpacing,
            Expanded(
              child: Text(
                title,
                style: 16.w400.copyWith(color: colorScheme.onSurface),
              ),
            ),
            12.horizSpacing,
            if (isLoading)
              const VendorKycLoadingIndicator()
            else
              SvgPicture.asset(
                EventraVectors.angleLeft,
                width: 20,
                height: 20,
                colorFilter: ColorFilter.mode(
                  colorScheme.primary,
                  BlendMode.srcIn,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
