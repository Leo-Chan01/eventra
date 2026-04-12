import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/client_bookings/presentation/models/enquiry_flow_details_args.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:flutter/material.dart';

class EnquiryInvoicePreviewTable extends StatelessWidget {
  const EnquiryInvoicePreviewTable({
    required this.args,
    required this.amountLabel,
    super.key,
  });

  final EnquiryFlowDetailsArgs args;
  final String amountLabel;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.35),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
            child: Row(
              children: [
                Expanded(
                  child: Text(l10n.enquiryFlowInvoiceItemName, style: 13.w600),
                ),
                Expanded(
                  child: Text(
                    l10n.enquiryFlowInvoiceQty,
                    textAlign: TextAlign.center,
                    style: 13.w600,
                  ),
                ),
                Expanded(
                  child: Text(
                    l10n.enquiryFlowInvoiceRate,
                    textAlign: TextAlign.center,
                    style: 13.w600,
                  ),
                ),
                Expanded(
                  child: Text(
                    l10n.enquiryFlowInvoiceAmount,
                    textAlign: TextAlign.end,
                    style: 13.w600,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 1,
            color: colorScheme.outline.withValues(alpha: 0.35),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
            child: Row(
              children: [
                Expanded(child: Text(args.eventType, style: 13.w400)),
                Expanded(
                  child: Text('1', textAlign: TextAlign.center, style: 13.w400),
                ),
                Expanded(
                  child: Text(
                    amountLabel,
                    textAlign: TextAlign.center,
                    style: 13.w400,
                  ),
                ),
                Expanded(
                  child: Text(
                    amountLabel,
                    textAlign: TextAlign.end,
                    style: 13.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
