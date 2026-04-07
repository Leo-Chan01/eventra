import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/client_notification/domain/models/transaction_record.dart';
import 'package:flutter/material.dart';

class TransactionStatusBadge extends StatelessWidget {
  const TransactionStatusBadge({
    required this.status,
    required this.label,
    super.key,
  });

  final TransactionStatus status;
  final String label;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final statusColor = switch (status) {
      TransactionStatus.completed => colorScheme.secondary,
      TransactionStatus.pending => colorScheme.tertiary,
      TransactionStatus.failed => colorScheme.error,
    };

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 7,
          height: 7,
          decoration: BoxDecoration(
            color: statusColor,
            shape: BoxShape.circle,
          ),
        ),
        4.horizSpacing,
        Text(
          label,
          style: 10.w600.copyWith(color: statusColor),
        ),
      ],
    );
  }
}
