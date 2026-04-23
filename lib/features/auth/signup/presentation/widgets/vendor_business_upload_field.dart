import 'package:eventra/core/utils/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VendorBusinessUploadField extends StatelessWidget {
  const VendorBusinessUploadField({
    required this.label,
    required this.hint,
    super.key,
  });

  final String label;
  final String hint;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: 14.w500.copyWith(color: colorScheme.onSurfaceVariant),
        ),
        12.vertSpacing,
        Center(
          child: SvgPicture.asset(
            hint,
            width: MediaQuery.sizeOf(context).width,
          ),
        ),
      ],
    );
  }
}
