import 'package:eventra/core/utils/num_extensions.dart';
import 'package:flutter/material.dart';

class EnquiryContractSection extends StatelessWidget {
  const EnquiryContractSection({
    required this.title,
    required this.child,
    super.key,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: 16.w700.copyWith(color: colorScheme.onSurface)),
          10.vertSpacing,
          child,
        ],
      ),
    );
  }
}
