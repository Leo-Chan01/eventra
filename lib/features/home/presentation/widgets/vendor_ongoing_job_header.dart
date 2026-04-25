import 'package:eventra/core/utils/num_extensions.dart';
import 'package:flutter/material.dart';

class VendorOngoingJobHeader extends StatelessWidget {
  const VendorOngoingJobHeader({
    required this.viewReceiptLabel,
    required this.onBack,
    required this.onViewReceipt,
    super.key,
  });

  final String viewReceiptLabel;
  final VoidCallback onBack;
  final VoidCallback onViewReceipt;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        IconButton(
          onPressed: onBack,
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: colorScheme.onSurface,
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: onViewReceipt,
          child: Text(
            viewReceiptLabel,
            style: 16.w500.copyWith(color: colorScheme.primary),
          ),
        ),
      ],
    );
  }
}
