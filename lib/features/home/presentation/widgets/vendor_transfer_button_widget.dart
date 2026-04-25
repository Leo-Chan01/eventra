import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/home/presentation/pages/vendor_transfer_success_page.dart';
import 'package:eventra/features/home/presentation/widgets/vendor_transaction_pin_sheet.dart';
import 'package:eventra/features/home/presentation/widgets/vendor_transfer_sheet.dart';
import 'package:eventra/l10n/gen/app_localizations.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

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
      onTap: () => _onTapTransfer(context),
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

  Future<void> _onTapTransfer(BuildContext context) async {
    final amount = await showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      builder: (_) => VendorTransferSheet(l10n: l10n),
    );

    if (!context.mounted || amount == null || amount.isEmpty) {
      return;
    }

    final pinValidated = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      builder: (_) => VendorTransactionPinSheet(l10n: l10n),
    );

    if (!context.mounted || pinValidated != true) {
      return;
    }

    await context.pushNamed(VendorTransferSuccessPage.name, extra: amount);
  }
}
