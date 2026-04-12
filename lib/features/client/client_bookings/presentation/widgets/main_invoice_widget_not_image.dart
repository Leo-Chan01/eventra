import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/client_bookings/presentation/models/enquiry_flow_details_args.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class MainReceiptWidgetNotImage extends StatelessWidget {
  const MainReceiptWidgetNotImage({
    required this.colorScheme,
    required this.args,
    required this.localeTag,
    required this.amountLabel,
    super.key,
  });

  final ColorScheme colorScheme;
  final EnquiryFlowDetailsArgs args;
  final String localeTag;
  final String amountLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: colorScheme.outline,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            args.vendor.name,
                            style: 16.w700.copyWith(
                              color: colorScheme.onSurface,
                            ),
                          ),
                          2.vertSpacing,
                          Text(
                            args.vendor.location,
                            style: 13.w400.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Invoice',
                      style: 24.w700.copyWith(
                        color: colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
                12.vertSpacing,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Bill To',
                            style: 13.w600.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                          4.vertSpacing,
                          Text(
                            'Tayo',
                            style: 14.w500.copyWith(
                              color: colorScheme.onSurface,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Invoice#:',
                            style: 13.w500.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                          3.vertSpacing,
                          Text(
                            args.invoiceId,
                            style: 14.w600.copyWith(
                              color: colorScheme.onSurface,
                            ),
                          ),
                          8.vertSpacing,
                          Text(
                            'Invoice Date:',
                            style: 13.w500.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                          3.vertSpacing,
                          Text(
                            intl.DateFormat.yMMMMd(
                              localeTag,
                            ).format(args.dateIssued),
                            style: 14.w600.copyWith(
                              color: colorScheme.onSurface,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            height: 1,
            thickness: 1,
            color: colorScheme.outline.withValues(alpha: 0.4),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Item Name',
                    style: 13.w600.copyWith(
                      color: colorScheme.onSurface,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Quantity',
                    textAlign: TextAlign.center,
                    style: 13.w600.copyWith(
                      color: colorScheme.onSurface,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Rate',
                    textAlign: TextAlign.center,
                    style: 13.w600.copyWith(
                      color: colorScheme.onSurface,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Amount',
                    textAlign: TextAlign.end,
                    style: 13.w600.copyWith(
                      color: colorScheme.onSurface,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: Text(args.eventType, style: 13.w400),
                ),
                Expanded(
                  child: Text(
                    '3',
                    textAlign: TextAlign.center,
                    style: 13.w400,
                  ),
                ),
                Expanded(
                  child: Text(
                    '25,000.0',
                    textAlign: TextAlign.center,
                    style: 13.w400,
                  ),
                ),
                Expanded(
                  child: Text(
                    amountLabel,
                    textAlign: TextAlign.end,
                    style: 13.w400,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 1,
            thickness: 1,
            color: colorScheme.outline.withValues(alpha: 0.4),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Subtotal',
                      style: 13.w400.copyWith(
                        color: colorScheme.onSurface,
                      ),
                    ),
                    Text(
                      amountLabel,
                      style: 13.w400.copyWith(
                        color: colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
                4.vertSpacing,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Sales Tax (2%)',
                      style: 13.w400.copyWith(
                        color: colorScheme.onSurface,
                      ),
                    ),
                    Text(
                      '1,500.00',
                      style: 13.w400.copyWith(
                        color: colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
                8.vertSpacing,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: 14.w700.copyWith(
                        color: colorScheme.onSurface,
                      ),
                    ),
                    Text(
                      '₦76,500.00',
                      style: 14.w700.copyWith(
                        color: colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
