import 'package:eventra/core/utils/num_extensions.dart';
import 'package:flutter/material.dart';

class TransactionSectionCard extends StatelessWidget {
  const TransactionSectionCard({
    required this.title,
    required this.child,
    super.key,
    this.trailing,
    this.leading,
  });

  final String title;
  final Widget child;
  final Widget? trailing;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withValues(alpha: 0.1),
            blurRadius: 40,
            offset: const Offset(0, 25),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: 16.w700.copyWith(color: colorScheme.onSurface),
                ),
              ),
              ?trailing,
            ],
          ),
          12.vertSpacing,
          child,
        ],
      ),
    );
  }
}
