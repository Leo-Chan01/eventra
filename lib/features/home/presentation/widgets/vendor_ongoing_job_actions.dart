import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/shared/widgets/eventra_buttons/eventra_button.dart';
import 'package:flutter/material.dart';

class VendorOngoingJobActions extends StatelessWidget {
  const VendorOngoingJobActions({
    required this.viewContractLabel,
    required this.completeJobLabel,
    required this.onViewContract,
    required this.onCompleteJob,
    super.key,
  });

  final String viewContractLabel;
  final String completeJobLabel;
  final VoidCallback onViewContract;
  final VoidCallback onCompleteJob;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        EventraButton(
          buttonText: viewContractLabel,
          onPressed: onViewContract,
        ),
        14.vertSpacing,
        TextButton(
          onPressed: onCompleteJob,
          child: Text(
            completeJobLabel,
            style: 16.w500.copyWith(color: colorScheme.primary),
          ),
        ),
      ],
    );
  }
}
