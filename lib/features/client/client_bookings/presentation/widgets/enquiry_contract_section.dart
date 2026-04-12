import 'package:eventra/core/utils/boxshadow_util.dart';
import 'package:eventra/core/utils/num_extensions.dart';
import 'package:flutter/material.dart';

class EnquiryContractSection extends StatelessWidget {
  const EnquiryContractSection({
    required this.number,
    required this.title,
    required this.child,
    super.key,
  });

  final int number;
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
        boxShadow: boxShadowLight,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 18,
                height: 18,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: colorScheme.primary,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  '$number',
                  style: 10.w700.copyWith(color: colorScheme.onPrimary),
                ),
              ),
              8.horizSpacing,
              Expanded(
                child: Text(
                  title,
                  style: 16.w700.copyWith(color: colorScheme.onSurface),
                ),
              ),
            ],
          ),
          10.vertSpacing,
          child,
        ],
      ),
    );
  }
}
