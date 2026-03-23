import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/shared/theme/color_schemes.dart';
import 'package:flutter/material.dart';

class EventraPasswordTextfield extends StatefulWidget {
  const EventraPasswordTextfield({required this.isConfirmPassword, super.key});

  final bool isConfirmPassword;

  @override
  State<EventraPasswordTextfield> createState() =>
      _EventraPasswordTextfieldState();
}

class _EventraPasswordTextfieldState extends State<EventraPasswordTextfield> {
  @override
  Widget build(BuildContext context) {
    final inputDecoration = Theme.of(context).inputDecorationTheme;
    const directColorScheme = AppColorSchemes.subtitleTextColor;
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.isConfirmPassword ? 'Confirm Password' : 'Password',
          style: 14.w500.copyWith(color: directColorScheme),
        ),
        TextFormField(
          obscureText: true,
          keyboardType: TextInputType.visiblePassword,
          autofillHints: const [AutofillHints.password],
          decoration: InputDecoration(
            hintText: widget.isConfirmPassword
                ? 'Confirm your password'
                : 'Enter your password',
            hintStyle: inputDecoration.hintStyle,
            border: inputDecoration.border,
            enabledBorder: inputDecoration.enabledBorder,
            focusedBorder: inputDecoration.focusedBorder,
            errorBorder: inputDecoration.errorBorder,
            disabledBorder: inputDecoration.disabledBorder,
            contentPadding: inputDecoration.contentPadding,
          ),
        ),
      ],
    );
  }
}
