import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/resources/resources.dart';
import 'package:eventra/shared/theme/color_schemes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AcceptanceSection extends StatelessWidget {
  const AcceptanceSection({required this.l10n, super.key});

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColorSchemes.successDark.withValues(alpha: 0.2),
        ),
      ),
      child: Column(
        children: [
          SvgPicture.asset(
            EventraVectors.checkmarkSolidGreenIconProfileSettings,
          ),
          8.vertSpacing,
          Text(
            l10n.acceptanceTitle,
            style: 16.bold,
          ),
          12.vertSpacing,
          Text(
            l10n.acceptanceContent,
            textAlign: TextAlign.center,
            style: 14.w400.copyWith(
              color: colorScheme.onSurfaceVariant,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
