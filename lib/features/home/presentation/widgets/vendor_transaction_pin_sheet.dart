import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/home/presentation/widgets/vendor_transaction_pin_boxes.dart';
import 'package:eventra/l10n/gen/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VendorTransactionPinSheet extends StatefulWidget {
  const VendorTransactionPinSheet({
    required this.l10n,
    super.key,
  });

  final AppLocalizations l10n;

  @override
  State<VendorTransactionPinSheet> createState() =>
      VendorTransactionPinSheetState();
}

class VendorTransactionPinSheetState extends State<VendorTransactionPinSheet> {
  String pin = '';
  late final TextEditingController pinController;
  late final FocusNode pinFocusNode;

  @override
  void initState() {
    super.initState();
    pinController = TextEditingController();
    pinFocusNode = FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        pinFocusNode.requestFocus();
      }
    });
  }

  @override
  void dispose() {
    pinController.dispose();
    pinFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final keyboardInset = MediaQuery.viewInsetsOf(context).bottom;

    return SafeArea(
      top: false,
      child: AnimatedPadding(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
        padding: EdgeInsets.fromLTRB(0, 12, 0, 16 + keyboardInset),
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => pinFocusNode.requestFocus(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Container(
                    width: 56,
                    height: 6,
                    decoration: BoxDecoration(
                      color: colorScheme.outlineVariant.withValues(alpha: 0.45),
                      borderRadius: BorderRadius.circular(999),
                    ),
                  ),
                ),
                12.vertSpacing,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          icon: Icon(
                            Icons.close,
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                      Text(
                        widget.l10n.vendorTransferPinTitle,
                        style: 22.w600.copyWith(color: colorScheme.onSurface),
                      ),
                    ],
                  ),
                ),
                24.vertSpacing,
                VendorTransactionPinBoxes(pinLength: pin.length),
                20.vertSpacing,
                Text(
                  widget.l10n.vendorTransferForgotPin,
                  style: 16.w500.copyWith(color: colorScheme.primary),
                ),
                12.vertSpacing,
                // Hidden input keeps native keyboard while UI stays as 4 pin boxes.
                SizedBox(
                  height: 1,
                  width: 1,
                  child: TextField(
                    controller: pinController,
                    focusNode: pinFocusNode,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(4),
                    ],
                    onChanged: _onPinChanged,
                    autofocus: true,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      isCollapsed: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onPinChanged(String value) {
    setState(() {
      pin = value;
    });

    if (pin.length == 4) {
      Navigator.of(context).pop(true);
    }
  }
}
