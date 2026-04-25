import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/home/presentation/widgets/vendor_transfer_account_card.dart';
import 'package:eventra/l10n/gen/app_localizations.dart';
import 'package:eventra/shared/widgets/eventra_buttons/eventra_button.dart';
import 'package:eventra/shared/widgets/eventra_input_fields/eventra_general_textfield.dart';
import 'package:flutter/material.dart';

class VendorTransferSheet extends StatefulWidget {
  const VendorTransferSheet({
    required this.l10n,
    super.key,
  });

  final AppLocalizations l10n;

  @override
  State<VendorTransferSheet> createState() => VendorTransferSheetState();
}

class VendorTransferSheetState extends State<VendorTransferSheet> {
  static const String _primaryAccountId = 'gtbank_primary';

  String amount = '';
  String selectedAccountId = _primaryAccountId;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final canSend = amount.trim().isNotEmpty && selectedAccountId.isNotEmpty;
    final keyboardInset = MediaQuery.viewInsetsOf(context).bottom;

    return SafeArea(
      top: false,
      child: AnimatedPadding(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
        padding: EdgeInsets.fromLTRB(16, 12, 16, 16 + keyboardInset),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 56,
                  height: 6,
                  decoration: BoxDecoration(
                    color: colorScheme.outlineVariant.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
              ),
              12.vertSpacing,
              Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icon(
                        Icons.close,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                  Text(
                    widget.l10n.vendorTransferTitle,
                    style: 20.w600.copyWith(color: colorScheme.onSurface),
                  ),
                ],
              ),
              20.vertSpacing,
              VendorTransferAccountCard(
                value: _primaryAccountId,
                groupValue: selectedAccountId,
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }

                  setState(() {
                    selectedAccountId = value;
                  });
                },
                l10n: widget.l10n,
              ),
              32.vertSpacing,
              EventraGeneralTextfield(
                label: widget.l10n.vendorTransferEnterAmountLabel,
                hint: widget.l10n.vendorTransferAmountHint,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    amount = value;
                  });
                },
              ),
              24.vertSpacing,
              EventraButton(
                buttonText: widget.l10n.vendorTransferSendButton,
                onPressed: canSend
                    ? () => Navigator.of(context).pop(amount.trim())
                    : null,
              ),
              8.vertSpacing,
            ],
          ),
        ),
      ),
    );
  }
}
