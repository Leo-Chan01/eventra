import 'package:eventra/core/utils/num_extensions.dart';
import 'package:flutter/material.dart';

class ProfilePasswordField extends StatelessWidget {
  const ProfilePasswordField({
    required this.label,
    required this.hintText,
    super.key,
  });

  final String label;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: 14.w600.copyWith(color: colorScheme.onSurface),
        ),
        8.vertSpacing,
        TextField(
          obscureText: true,
          style: 15.w500.copyWith(color: colorScheme.onSurface),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: 15.w400.copyWith(color: colorScheme.onSurfaceVariant),
            suffixIcon: Icon(
              Icons.visibility_outlined,
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      ],
    );
  }
}
