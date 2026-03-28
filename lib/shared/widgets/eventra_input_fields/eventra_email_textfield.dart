import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/shared/theme/color_schemes.dart';
import 'package:flutter/material.dart';

class EventraEmailTextField extends StatefulWidget {
  const EventraEmailTextField({super.key});

  @override
  State<EventraEmailTextField> createState() => _EventraEmailTextFieldState();
}

class _EventraEmailTextFieldState extends State<EventraEmailTextField> {
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
          'Email Address',
          style: 14.w500.copyWith(color: directColorScheme),
        ),
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          autofillHints: const [AutofillHints.email],
          decoration: InputDecoration(
            hintText: 'Enter your email address',
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
