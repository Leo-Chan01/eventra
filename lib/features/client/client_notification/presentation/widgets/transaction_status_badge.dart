import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/features/client/client_notification/domain/models/transaction_record.dart';
import 'package:eventra/resources/resources.dart';
import 'package:eventra/shared/theme/color_schemes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    // final colorScheme = Theme.of(context).colorScheme;
    final statusColor = switch (status) {
      TransactionStatus.completed => AppColorSchemes.successDark,
      TransactionStatus.pending => AppColorSchemes.primary500,
      TransactionStatus.failed => AppColorSchemes.error,
    };
    final statusIcon = switch (status) {
      TransactionStatus.completed => EventraVectors.goodCheckGreen,
      TransactionStatus.pending => EventraVectors.pendingIconOrgange,
      TransactionStatus.failed => EventraVectors.redCancelIcon,
    };

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          statusIcon,
          width: 12,
          height: 12,
        ),
        4.horizSpacing,
        Text(
          label,
          style: 11.w600.copyWith(color: statusColor),
        ),
      ],
    );
  }
}
