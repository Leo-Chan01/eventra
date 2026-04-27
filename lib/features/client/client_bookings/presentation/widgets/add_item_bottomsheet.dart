import 'package:eventra/core/utils/global_snackbar.dart';
import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/client_bookings/presentation/pages/new_invoice_page.dart';
import 'package:eventra/features/client/client_bookings/presentation/widgets/add_item_quantity_field.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/shared/widgets/eventra_buttons/eventra_button.dart';
import 'package:eventra/shared/widgets/eventra_input_fields/eventra_general_textfield.dart';
import 'package:flutter/material.dart';

class AddItemBottomSheet extends StatefulWidget {
  const AddItemBottomSheet({required this.onItemAdded, super.key});

  final void Function(InvoiceItem) onItemAdded;

  @override
  State<AddItemBottomSheet> createState() => _AddItemBottomSheetState();
}

class _AddItemBottomSheetState extends State<AddItemBottomSheet> {
  String _description = '';
  int _quantity = 1;
  String _price = '';

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsets.fromLTRB(
        14,
        18,
        14,
        MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              child: Text(
                l10n.addItemDetails,
                style: 18.w600.copyWith(color: colorScheme.onSurface),
              ),
            ),
            20.vertSpacing,
            EventraGeneralTextfield(
              label: l10n.enquiryFlowInvoiceItemName,
              hint: '',
              isRequired: true,
              keyboardType: TextInputType.text,
              onChanged: (value) => _description = value,
            ),
            24.vertSpacing,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: EventraGeneralTextfield(
                    label: l10n.enquiryFlowInvoiceRate,
                    hint: '0',
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    onChanged: (value) => _price = value,
                  ),
                ),
                31.horizSpacing,
                Expanded(
                  child: AddItemQuantityField(
                    label: l10n.quantityLabel,
                    value: _quantity,
                    onDecrease: () {
                      if (_quantity <= 1) {
                        return;
                      }
                      setState(() {
                        _quantity -= 1;
                      });
                    },
                    onIncrease: () {
                      setState(() {
                        _quantity += 1;
                      });
                    },
                  ),
                ),
              ],
            ),
            75.vertSpacing,
            EventraButton(
              buttonText: l10n.addItemInvoiceOK,
              onPressed: _addItem,
              height: 58,
              borderRadius: 30,
            ),
          ],
        ),
      ),
    );
  }

  void _addItem() {
    final l10n = context.l10n;

    if (_description.trim().isEmpty) {
      GlobalSnackBar.showError(l10n.errorDescriptionRequired);
      return;
    }
    if (_price.trim().isEmpty) {
      GlobalSnackBar.showError(l10n.errorPriceRequired);
      return;
    }

    final price = double.tryParse(_price) ?? 0;

    if (_quantity <= 0) {
      GlobalSnackBar.showError(l10n.errorQuantityInvalid);
      return;
    }
    if (price <= 0) {
      GlobalSnackBar.showError(l10n.errorPriceInvalid);
      return;
    }

    widget.onItemAdded(
      InvoiceItem(
        description: _description.trim(),
        quantity: _quantity,
        unitPrice: price,
      ),
    );
  }
}
