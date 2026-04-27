import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeProfileKycBanner extends StatelessWidget {
  const HomeProfileKycBanner({
    required this.onTap,
    super.key,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      key: const Key('home_profile_kyc_banner'),
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        decoration: BoxDecoration(
          color: colorScheme.primary,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              EventraVectors.completeKycVerificationIcon,
              width: 40,
              height: 40,
              colorFilter: ColorFilter.mode(
                colorScheme.onPrimary,
                BlendMode.srcIn,
              ),
            ),
            16.horizSpacing,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    l10n.homeProfileKycTitle,
                    style: 15.w700.copyWith(color: colorScheme.onPrimary),
                  ),
                  4.vertSpacing,
                  Text(
                    l10n.homeProfileKycSubtitle,
                    style: 12.w400.copyWith(
                      color: colorScheme.onPrimary.withValues(alpha: 0.85),
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
            12.horizSpacing,
            SvgPicture.asset(
              EventraVectors.angleLeft,
              width: 18,
              height: 18,
              colorFilter: ColorFilter.mode(
                colorScheme.onPrimary,
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
