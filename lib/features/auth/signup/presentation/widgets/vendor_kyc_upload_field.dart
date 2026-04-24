import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VendorKycUploadField extends StatelessWidget {
  const VendorKycUploadField({
    required this.label,
    required this.hint,
    this.onTap,
    super.key,
  });

  final String label;
  final String hint;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final inputTheme = Theme.of(context).inputDecorationTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: 14.w500.copyWith(color: colorScheme.onSurfaceVariant),
        ),
        8.vertSpacing,
        TextFormField(
          readOnly: true,
          onTap: onTap,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: inputTheme.hintStyle,
            border: inputTheme.border,
            enabledBorder: inputTheme.enabledBorder,
            focusedBorder: inputTheme.focusedBorder,
            errorBorder: inputTheme.errorBorder,
            disabledBorder: inputTheme.disabledBorder,
            contentPadding: inputTheme.contentPadding,
            suffixIcon: Padding(
              padding: const EdgeInsets.all(12),
              child: SvgPicture.asset(
                EventraVectors.primeUploadIcon,
                height: 14,
                width: 14,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
