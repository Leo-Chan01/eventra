import 'package:eventra/core/utils/num_extensions.dart';
import 'package:flutter/material.dart';

class VendorEditProfileServiceField extends StatelessWidget {
  const VendorEditProfileServiceField({
    required this.initialValue,
    this.hintText,
    super.key,
  });

  final String initialValue;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    final inputDecoration = Theme.of(context).inputDecorationTheme;

    return TextFormField(
      initialValue: initialValue,
      decoration: InputDecoration(
        hintText: hintText ?? initialValue,
        hintStyle: inputDecoration.hintStyle,
        border: inputDecoration.border,
        enabledBorder: inputDecoration.enabledBorder,
        focusedBorder: inputDecoration.focusedBorder,
        errorBorder: inputDecoration.errorBorder,
        disabledBorder: inputDecoration.disabledBorder,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 14,
        ),
      ),
      style: 16.w400,
    );
  }
}
