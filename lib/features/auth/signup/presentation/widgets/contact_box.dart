import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContactBox extends StatelessWidget {
  const ContactBox({required this.l10n, super.key});

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: colorScheme.primary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          SvgPicture.asset(
            EventraVectors.mailIcon,
            width: 24,
            height: 24,
            colorFilter: ColorFilter.mode(
              colorScheme.onPrimary,
              BlendMode.srcIn,
            ),
          ),
          12.vertSpacing,
          Text(
            l10n.contactInfoTitle,
            style: 18.bold.copyWith(color: colorScheme.onPrimary),
          ),
          4.vertSpacing,
          Text(
            l10n.contactInfoSubtitle,
            style: 14.regular.copyWith(
              color: colorScheme.onPrimary.withValues(alpha: 0.8),
            ),
          ),
          16.vertSpacing,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                EventraVectors.mailIcon,
                width: 16,
                height: 16,
                colorFilter: ColorFilter.mode(
                  colorScheme.onPrimary,
                  BlendMode.srcIn,
                ),
              ),
              8.horizSpacing,
              Text(
                l10n.contactEmail,
                style: 14.w500.copyWith(color: colorScheme.onPrimary),
              ),
            ],
          ),
          8.vertSpacing,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                EventraVectors.locationPin,
                colorFilter: ColorFilter.mode(
                  colorScheme.onPrimary,
                  BlendMode.srcIn,
                ),
                width: 16,
                height: 16,
              ),
              8.horizSpacing,
              Text(
                l10n.contactEntity,
                style: 14.w500.copyWith(color: colorScheme.onPrimary),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
