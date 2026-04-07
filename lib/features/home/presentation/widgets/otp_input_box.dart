import 'package:eventra/core/utils/num_extensions.dart';
import 'package:flutter/material.dart';

class OtpInputBox extends StatelessWidget {
  const OtpInputBox({
    required this.controller,
    required this.focusNode,
    required this.onChanged,
    super.key,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return SizedBox(
      width: 60,
      height: 60,
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        style: 24.w400.copyWith(color: colorScheme.onSurface),
        decoration: InputDecoration(
          counterText: '',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3),
            borderSide: BorderSide(
              color: colorScheme.primary,
              width: 2,
            ),
          ),
          fillColor: colorScheme.secondaryContainer,
          filled: true,
        ),
        onChanged: onChanged,
      ),
    );
  }
}
