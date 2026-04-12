import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/client_bookings/presentation/widgets/enquiry_payment_detail_row.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/resources/resources.dart';
import 'package:eventra/shared/widgets/eventra_buttons/eventra_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EnquiryPaymentBottomSheet extends StatelessWidget {
  const EnquiryPaymentBottomSheet({
    required this.amountLabel,
    required this.onContinue,
    required this.onClose,
    super.key,
  });

  final String amountLabel;
  final VoidCallback onContinue;
  final VoidCallback onClose;

  static Future<void> show(
    BuildContext context, {
    required String amountLabel,
    required VoidCallback onContinue,
  }) async {
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) => EnquiryPaymentBottomSheet(
        amountLabel: amountLabel,
        onContinue: onContinue,
        onClose: () => Navigator.of(sheetContext).maybePop(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;
    final maxHeight = MediaQuery.sizeOf(context).height * 0.9;

    return SafeArea(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: maxHeight),
        child: Container(
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(36)),
          ),
          padding: const EdgeInsets.fromLTRB(18, 10, 18, 24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: 44,
                    height: 4,
                    decoration: BoxDecoration(
                      color: colorScheme.outline.withValues(alpha: 0.4),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                12.vertSpacing,
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        l10n.enquiryFlowPaymentSheetTitle,
                        textAlign: TextAlign.center,
                        style: 20.w700.copyWith(color: colorScheme.onSurface),
                      ),
                    ),
                    IconButton(
                      onPressed: onClose,
                      icon: SvgPicture.asset(
                        EventraVectors.cancelSearchIcon,
                        height: 40,
                        width: 40,
                      ),
                    ),
                  ],
                ),
                12.vertSpacing,
                Text(
                  l10n.enquiryFlowPaymentSheetHeader,
                  style: 16.w700.copyWith(color: colorScheme.onSurface),
                ),
                10.vertSpacing,
                Text(
                  l10n.enquiryFlowPaymentSheetBody,
                  style: 14.w400.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    height: 1.4,
                  ),
                ),
                20.vertSpacing,
                EnquiryPaymentDetailRow(
                  label: l10n.enquiryFlowPaymentBank,
                  value: l10n.enquiryFlowPaymentBankValue,
                ),
                Divider(color: colorScheme.outline.withValues(alpha: 0.25)),
                EnquiryPaymentDetailRow(
                  label: l10n.enquiryFlowPaymentAccountNo,
                  value: l10n.enquiryFlowPaymentAccountNoValue,
                ),
                Divider(color: colorScheme.outline.withValues(alpha: 0.25)),
                EnquiryPaymentDetailRow(
                  label: l10n.enquiryFlowPaymentAccountName,
                  value: l10n.enquiryFlowPaymentAccountNameValue,
                ),
                Divider(color: colorScheme.outline.withValues(alpha: 0.25)),
                EnquiryPaymentDetailRow(
                  label: l10n.enquiryFlowPaymentAmountLabel,
                  value: amountLabel,
                  valueColor: colorScheme.primary,
                  valueWeight: FontWeight.w700,
                ),
                22.vertSpacing,
                Text(
                  l10n.enquiryFlowPaymentUploadSlip,
                  style: 14.w500.copyWith(color: colorScheme.onSurface),
                ),
                10.vertSpacing,
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: colorScheme.onSurface.withValues(
                      alpha: 0.03,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(45),
                    child: SvgPicture.asset(
                      EventraVectors.emptyImageIcon,
                    ),
                  ),
                ),
                26.vertSpacing,
                EventraButton(
                  buttonText: l10n.enquiryFlowContinue,
                  onPressed: onContinue,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
