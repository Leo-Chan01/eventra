import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionMonthFilter extends StatelessWidget {
  const TransactionMonthFilter({
    required this.selectedMonth,
    required this.onSelected,
    super.key,
  });

  final int? selectedMonth;
  final ValueChanged<int?> onSelected;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;

    return PopupMenuButton<int?>(
      key: const Key('transaction_month_filter_button'),
      initialValue: selectedMonth,
      onSelected: onSelected,
      color: colorScheme.surface,
      elevation: 0,
      itemBuilder: (context) {
        return [
          PopupMenuItem<int?>(
            value: null,
            child: Text(l10n.notificationsFilterAll),
          ),
          ...List.generate(
            12,
            (index) => PopupMenuItem<int?>(
              value: index + 1,
              child: Text(_monthLabel(index + 1)),
            ),
          ),
        ];
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            selectedMonth == null
                ? l10n.notificationsFilterAll
                : _monthLabel(selectedMonth!),
            style: 13.w600.copyWith(color: colorScheme.onSurface),
          ),
          2.horizSpacing,
          Icon(
            Icons.keyboard_arrow_down_rounded,
            size: 18,
            color: colorScheme.onSurface,
          ),
        ],
      ),
    );
  }

  String _monthLabel(int month) {
    return DateFormat('MMM').format(DateTime(2026, month));
  }
}
