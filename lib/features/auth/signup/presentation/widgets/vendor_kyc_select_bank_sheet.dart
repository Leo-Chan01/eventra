import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:flutter/material.dart';

class VendorKycSelectBankSheet extends StatefulWidget {
  const VendorKycSelectBankSheet({
    required this.selectedBank,
    super.key,
  });

  final String? selectedBank;

  static Future<String?> show(
    BuildContext context, {
    required String? selectedBank,
  }) {
    return showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => VendorKycSelectBankSheet(selectedBank: selectedBank),
    );
  }

  @override
  State<VendorKycSelectBankSheet> createState() =>
      VendorKycSelectBankSheetState();
}

class VendorKycSelectBankSheetState extends State<VendorKycSelectBankSheet> {
  final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;
    final banks = [
      l10n.vendorKycBankAccess,
      l10n.vendorKycBankUba,
      l10n.vendorKycBankFidelity,
      l10n.vendorKycBankKeystone,
      l10n.vendorKycBankOpay,
      l10n.vendorKycBankJaiz,
      l10n.vendorKycBankGlobus,
      l10n.vendorKycBankProvidus,
    ];

    final query = searchController.text.trim().toLowerCase();
    final filteredBanks = banks
        .where((bank) => bank.toLowerCase().contains(query))
        .toList();

    return SafeArea(
      top: false,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          16,
          8,
          16,
          MediaQuery.of(context).viewInsets.bottom + 12,
        ),
        child: SizedBox(
          height: 520,
          child: Column(
            children: [
              Container(
                width: 42,
                height: 4,
                decoration: BoxDecoration(
                  color: colorScheme.outline.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              14.vertSpacing,
              Row(
                children: [
                  const Spacer(),
                  Text(
                    l10n.vendorKycBankPickerTitle,
                    style: 32.w400.copyWith(color: colorScheme.onSurface),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: Icon(Icons.close, color: colorScheme.onSurface),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
              8.vertSpacing,
              TextField(
                controller: searchController,
                onChanged: (_) => setState(() {}),
                decoration: InputDecoration(
                  hintText: l10n.vendorKycBankSearchHint,
                  prefixIcon: const Icon(Icons.search),
                ),
              ),
              14.vertSpacing,
              Expanded(
                child: ListView.separated(
                  itemCount: filteredBanks.length,
                  separatorBuilder: (_, _) => Divider(
                    color: colorScheme.outline.withValues(alpha: 0.2),
                    height: 0,
                  ),
                  itemBuilder: (context, index) {
                    final bank = filteredBanks[index];
                    final isSelected = bank == widget.selectedBank;
                    return ListTile(
                      title: Text(
                        bank,
                        style: 16.w400.copyWith(color: colorScheme.onSurface),
                      ),
                      trailing: isSelected
                          ? Icon(Icons.check, color: colorScheme.primary)
                          : null,
                      onTap: () => Navigator.of(context).pop(bank),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
