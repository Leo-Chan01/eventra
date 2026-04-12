import 'package:eventra/core/utils/num_extensions.dart';
import 'package:flutter/material.dart';

class EnquiryInvoiceLineItem extends StatelessWidget {
  const EnquiryInvoiceLineItem({
    required this.itemName,
    required this.quantity,
    required this.rate,
    required this.amount,
    super.key,
  });

  final String itemName;
  final String quantity;
  final String rate;
  final String amount;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        children: [
          Expanded(
            child: Text(
              itemName,
              style: 16.w400.copyWith(color: colorScheme.onSurfaceVariant),
            ),
          ),
          Expanded(
            child: Text(
              quantity,
              textAlign: TextAlign.center,
              style: 16.w400.copyWith(color: colorScheme.onSurfaceVariant),
            ),
          ),
          Expanded(
            child: Text(
              rate,
              textAlign: TextAlign.center,
              style: 16.w400.copyWith(color: colorScheme.onSurfaceVariant),
            ),
          ),
          Expanded(
            child: Text(
              amount,
              textAlign: TextAlign.end,
              style: 16.w400.copyWith(color: colorScheme.onSurfaceVariant),
            ),
          ),
        ],
      ),
    );
  }
}
