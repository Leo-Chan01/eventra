import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/l10n/gen/app_localizations.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TransferButtonWidget extends StatelessWidget {
  const TransferButtonWidget({
    required this.colorScheme,
    required this.l10n,
    super.key,
  });

  final ColorScheme colorScheme;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //TODO(KINGRAYM): Handle transfer button tap
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 9,
        ),
        decoration: BoxDecoration(
          color: colorScheme.primary,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Row(
          children: [
            Text(
              l10n.vendorHomeTransfer,
              style: 14.w500.copyWith(
                color: colorScheme.onPrimary,
              ),
            ),
            10.horizSpacing,
            SvgPicture.asset(EventraVectors.moneySendOutWhiteIcon),
          ],
        ),
      ),
    );
  }
}
