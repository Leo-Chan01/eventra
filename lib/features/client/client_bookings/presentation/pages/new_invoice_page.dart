import 'package:eventra/core/utils/global_snackbar.dart';
import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/client_bookings/presentation/widgets/add_item_bottomsheet.dart';
import 'package:eventra/features/client/client_bookings/presentation/widgets/client_information_card.dart';
import 'package:eventra/features/client/client_bookings/presentation/widgets/invoice_add_item_field.dart';
import 'package:eventra/features/client/client_bookings/presentation/widgets/item_card.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/shared/widgets/eventra_buttons/eventra_button.dart';
import 'package:eventra/shared/widgets/eventra_input_fields/eventra_general_textfield.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart' as intl;

class NewInvoicePageArgs {
  const NewInvoicePageArgs({
    required this.bookingId,
    required this.clientName,
    required this.clientAvatarPath,
    required this.eventType,
    required this.eventDate,
  });

  final String bookingId;
  final String clientName;
  final String clientAvatarPath;
  final String eventType;
  final DateTime eventDate;
}

class NewInvoicePage extends StatefulWidget {
  const NewInvoicePage({super.key});

  static const String path = '/new-invoice';
  static const String name = 'new-invoice';

  @override
  State<NewInvoicePage> createState() => _NewInvoicePageState();
}

class _NewInvoicePageState extends State<NewInvoicePage> {
  NewInvoicePageArgs? _args;

  late DateTime _invoiceDate;
  DateTime? _dueDate;

  late String _invoiceNumber;
  late String _invoiceDateText;
  String _dueDateText = '';
  String _note = '';
  String _terms = '';
  String _salesTaxPercentText = '0.00';
  final TextEditingController _salesTaxController = TextEditingController(
    text: '0.00',
  );

  final List<InvoiceItem> _items = <InvoiceItem>[];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_args != null) {
      return;
    }

    final extra = GoRouterState.of(context).extra;
    if (extra is! NewInvoicePageArgs) {
      return;
    }

    _args = extra;
    _invoiceDate = DateTime.now();
    _invoiceDateText = _formatDate(_invoiceDate);
    _invoiceNumber = _buildInvoiceNumber(extra.bookingId);
  }

  String _buildInvoiceNumber(String bookingId) {
    final prefix = bookingId.length >= 4
        ? bookingId.substring(0, 4)
        : bookingId.padRight(4, '0');
    return 'INV-${prefix.toUpperCase()}';
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/'
        '${date.year}';
  }

  Future<void> _selectInvoiceDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _invoiceDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );

    if (pickedDate == null) {
      return;
    }

    setState(() {
      _invoiceDate = pickedDate;
      _invoiceDateText = _formatDate(pickedDate);

      if (_dueDate != null && _dueDate!.isBefore(pickedDate)) {
        _dueDate = pickedDate;
        _dueDateText = _formatDate(pickedDate);
      }
    });
  }

  Future<void> _selectDueDate() async {
    final initialDate = _dueDate ?? _invoiceDate.add(const Duration(days: 7));
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: _invoiceDate,
      lastDate: DateTime(2100),
    );

    if (pickedDate == null) {
      return;
    }

    setState(() {
      _dueDate = pickedDate;
      _dueDateText = _formatDate(pickedDate);
    });
  }

  Future<void> _addItem() async {
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return AddItemBottomSheet(
          onItemAdded: (item) {
            setState(() {
              _items.add(item);
            });
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _salesTaxController.dispose();
    super.dispose();
  }

  void _increaseItemQuantity(int index) {
    final current = _items[index];
    setState(() {
      _items[index] = current.copyWith(quantity: current.quantity + 1);
    });
  }

  void _decreaseItemQuantity(int index) {
    final current = _items[index];
    if (current.quantity <= 1) {
      return;
    }

    setState(() {
      _items[index] = current.copyWith(quantity: current.quantity - 1);
    });
  }

  void _removeAllItems() {
    setState(() {
      _items.clear();
    });
  }

  double get _subTotal {
    return _items.fold<double>(0, (previous, item) => previous + item.total);
  }

  double get _salesTaxPercent {
    return double.tryParse(_salesTaxPercentText) ?? 0;
  }

  double get _salesTaxAmount {
    return (_subTotal * _salesTaxPercent) / 100;
  }

  double get _grandTotal {
    return _subTotal + _salesTaxAmount;
  }

  String _formatMoney(BuildContext context, double value) {
    final localeTag = Localizations.localeOf(context).toLanguageTag();
    return intl.NumberFormat('#,##0.00', localeTag).format(value);
  }

  void _generateInvoice() {
    final l10n = context.l10n;

    if (_invoiceNumber.trim().isEmpty) {
      GlobalSnackBar.showError(l10n.errorInvoiceNumberRequired);
      return;
    }

    if (_items.isEmpty) {
      GlobalSnackBar.showError(l10n.errorItemsRequired);
      return;
    }

    if (_note.trim().isEmpty) {
      GlobalSnackBar.showError(l10n.errorDescriptionRequired);
      return;
    }

    if (_terms.trim().isEmpty) {
      GlobalSnackBar.showError(l10n.errorTermsRequired);
      return;
    }

    GlobalSnackBar.showSuccess(l10n.invoiceGeneratedSuccessfully);
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final args = _args;
    if (args == null) {
      return const Scaffold(body: SizedBox.shrink());
    }

    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).maybePop(),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: Text(
          l10n.newInvoicePageTitle,
          style: 18.w600.copyWith(color: colorScheme.onSurface),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClientInformationCard(
                clientName: args.clientName,
                clientAvatarPath: args.clientAvatarPath,
                eventType: args.eventType,
                eventDate: args.eventDate,
              ),
              24.vertSpacing,
              Text(
                l10n.invoiceLabel,
                style: 16.w600.copyWith(color: colorScheme.onSurface),
              ),
              12.vertSpacing,
              EventraGeneralTextfield(
                label: l10n.invoiceNumberLabel,
                hint: _invoiceNumber,
                keyboardType: TextInputType.text,
                initialValue: _invoiceNumber,
                isRequired: true,
                onChanged: (value) => _invoiceNumber = value,
              ),
              20.vertSpacing,
              Row(
                children: [
                  Expanded(
                    child: EventraGeneralTextfield(
                      key: ValueKey<String>('invoice-date-$_invoiceDateText'),
                      label: l10n.invoiceDateLabel,
                      hint: l10n.birthdayHint,
                      keyboardType: TextInputType.datetime,
                      readOnly: true,
                      initialValue: _invoiceDateText,
                      onTap: _selectInvoiceDate,
                    ),
                  ),
                  12.horizSpacing,
                  Expanded(
                    child: EventraGeneralTextfield(
                      key: ValueKey<String>('due-date-$_dueDateText'),
                      label: l10n.dueDateLabel,
                      hint: l10n.birthdayHint,
                      keyboardType: TextInputType.datetime,
                      readOnly: true,
                      initialValue: _dueDateText,
                      onTap: _selectDueDate,
                    ),
                  ),
                ],
              ),
              24.vertSpacing,
              InvoiceAddItemField(
                label: l10n.itemLabel,
                buttonText: l10n.addItemDetails,
                isRequired: true,
                onTap: _addItem,
              ),
              if (_items.isNotEmpty) ...[
                12.vertSpacing,
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Text(
                            l10n.itemLabel,
                            style: 14.w500.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                          Text(
                            ' *',
                            style: 14.w500.copyWith(
                              color: colorScheme.error,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: _removeAllItems,
                      child: Text(
                        l10n.profileSavedVendorsRemove,
                        style: 16.w500.copyWith(color: colorScheme.error),
                      ),
                    ),
                  ],
                ),
                8.vertSpacing,
                Container(
                  decoration: BoxDecoration(
                    color: colorScheme.surface,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: colorScheme.outline),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...List<Widget>.generate(
                        _items.length,
                        (index) => ItemCard(
                          item: _items[index],
                          amountText: _formatMoney(
                            context,
                            _items[index].total,
                          ),
                          lineSummaryText:
                              '${_formatMoney(context, _items[index].unitPrice)} x ${_items[index].quantity}',
                          onDecrease: () => _decreaseItemQuantity(index),
                          onIncrease: () => _increaseItemQuantity(index),
                        ),
                      ),
                      Divider(
                        color: colorScheme.outline,
                        height: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 14),
                        child: EventraButton.outlined(
                          width: 146,
                          height: 48,
                          borderRadius: 14,
                          buttonText: l10n.addButtonLabel,
                          onPressed: _addItem,
                        ),
                      ),
                      Divider(
                        color: colorScheme.outline,
                        height: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    l10n.enquiryFlowInvoiceSubtotal,
                                    style: 18.w500.copyWith(
                                      color: colorScheme.onSurface,
                                    ),
                                  ),
                                ),
                                Text(
                                  _formatMoney(context, _subTotal),
                                  style: 18.w500.copyWith(
                                    color: colorScheme.onSurface,
                                  ),
                                ),
                              ],
                            ),
                            18.vertSpacing,
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    l10n.enquiryFlowInvoiceVat,
                                    style: 18.w500.copyWith(
                                      color: colorScheme.onSurface,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 108,
                                  height: 46,
                                  decoration: BoxDecoration(
                                    color: colorScheme.surfaceContainerHighest,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: TextField(
                                          controller: _salesTaxController,
                                          keyboardType:
                                              const TextInputType.numberWithOptions(
                                                decimal: true,
                                              ),
                                          textAlign: TextAlign.center,
                                          style: 14.w500.copyWith(
                                            color: colorScheme.onSurface,
                                          ),
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                  vertical: 12,
                                                ),
                                          ),
                                          onChanged: (value) {
                                            setState(() {
                                              _salesTaxPercentText = value;
                                            });
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          right: 12,
                                        ),
                                        child: Text(
                                          '%',
                                          style: 16.w500.copyWith(
                                            color: colorScheme.onSurface,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                12.horizSpacing,
                                SizedBox(
                                  width: 72,
                                  child: Text(
                                    _formatMoney(context, _salesTaxAmount),
                                    textAlign: TextAlign.right,
                                    style: 18.w500.copyWith(
                                      color: colorScheme.onSurface,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: colorScheme.outline,
                        height: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 18),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                l10n.enquiryFlowInvoiceTotal,
                                style: 18.w500.copyWith(
                                  color: colorScheme.onSurface,
                                ),
                              ),
                            ),
                            Text(
                              'N${_formatMoney(context, _grandTotal)}',
                              style: 20.w500.copyWith(
                                color: colorScheme.onSurface,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              24.vertSpacing,
              EventraGeneralTextfield(
                label: l10n.noteLabel,
                hint: l10n.shortNote,
                keyboardType: TextInputType.multiline,
                isRequired: true,
                onChanged: (value) => _note = value,
              ),
              16.vertSpacing,
              EventraGeneralTextfield(
                label: l10n.termsAndConditionLabel,
                hint: l10n.termsAndConditionLabel,
                keyboardType: TextInputType.multiline,
                initialValue: _terms,
                isRequired: true,
                onChanged: (value) => _terms = value,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: EventraButton(
          buttonText: l10n.generateInvoiceButton,
          height: 64,
          borderRadius: 32,
          onPressed: _generateInvoice,
        ),
      ),
    );
  }
}

class InvoiceItem {
  const InvoiceItem({
    required this.description,
    required this.quantity,
    required this.unitPrice,
  });

  final String description;
  final int quantity;
  final double unitPrice;

  double get total => quantity * unitPrice;

  InvoiceItem copyWith({
    String? description,
    int? quantity,
    double? unitPrice,
  }) {
    return InvoiceItem(
      description: description ?? this.description,
      quantity: quantity ?? this.quantity,
      unitPrice: unitPrice ?? this.unitPrice,
    );
  }
}
