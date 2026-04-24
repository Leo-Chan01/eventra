import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/core/utils/price_formatter.dart';
import 'package:eventra/features/home/presentation/widgets/vendor_transfer_button_widget.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VendorWalletSummaryCard extends StatelessWidget {
  const VendorWalletSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;

    return AspectRatio(
      aspectRatio: 3 / 1,
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 11, 16, 31),
        decoration: BoxDecoration(
          color: colorScheme.scrim,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  l10n.vendorHomeWallet,
                  style: 12.w500.copyWith(
                    color: colorScheme.onPrimary,
                  ),
                ),
                12.horizSpacing,
                SvgPicture.asset(EventraVectors.eyeIconWhite),
                const Spacer(),
                Text(
                  l10n.vendorHomeTransactionHistory,
                  style: 17.w600.copyWith(color: colorScheme.onPrimary),
                ),
                20.vertSpacing,
              ],
            ),
            const Spacer(),
            Row(
              children: [
                Text(
                  '10000000'.toNaira(),
                  style: 24.w700.copyWith(color: colorScheme.onPrimary),
                ),
                const Spacer(),
                TransferButtonWidget(colorScheme: colorScheme, l10n: l10n),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
