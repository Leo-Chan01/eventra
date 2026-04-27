import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InvoiceAddItemField extends StatelessWidget {
  const InvoiceAddItemField({
    required this.label,
    required this.buttonText,
    required this.onTap,
    this.isRequired = false,
    super.key,
  });

  final String label;
  final String buttonText;
  final VoidCallback onTap;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: 14.w500.copyWith(color: colorScheme.onSurfaceVariant),
            ),
            if (isRequired)
              Text(
                ' *',
                style: 14.w500.copyWith(color: colorScheme.error),
              ),
          ],
        ),
        8.vertSpacing,
        Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(18),
            onTap: onTap,
            child: Ink(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: colorScheme.onSurface.withValues(alpha: 0.1),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(EventraVectors.addItemIcon),
                  12.horizSpacing,
                  Text(
                    buttonText,
                    style: 14.w400.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
