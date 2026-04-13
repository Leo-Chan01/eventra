import 'package:eventra/core/utils/num_extensions.dart';
import 'package:flutter/material.dart';

class TicketCardInputField extends StatelessWidget {
  const TicketCardInputField({
    required this.controller,
    required this.hint,
    required this.keyboardType,
    this.maxLength,
    super.key,
  });

  final TextEditingController controller;
  final String hint;
  final TextInputType keyboardType;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      maxLength: maxLength,
      style: 20.w400.copyWith(color: colorScheme.onSurface),
      decoration: InputDecoration(
        counterText: '',
        hintText: hint,
        hintStyle: 20.w400.copyWith(color: colorScheme.onSurfaceVariant),
        filled: true,
        fillColor: colorScheme.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 18,
        ),
      ),
    );
  }
}
