import 'package:eventra/core/utils/custom_log_file.dart';
import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/shared/theme/color_schemes.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class EventraGeneralTextfield extends StatefulWidget {
  const EventraGeneralTextfield({
    required this.hint,
    required this.label,
    required this.autoFillHints,
    required this.keyboardType,
    this.isPin = false,
    super.key,
  });

  const EventraGeneralTextfield.pinPut({
    required this.hint,
    required this.label,
    required this.autoFillHints,
    required this.keyboardType,
    this.isPin = true,
    super.key,
  });

  final String hint;
  final String label;
  final Iterable<String>? autoFillHints;
  final TextInputType keyboardType;
  final bool isPin;

  @override
  State<EventraGeneralTextfield> createState() =>
      _EventraGeneralTextfieldState();
}

class _EventraGeneralTextfieldState extends State<EventraGeneralTextfield> {
  @override
  Widget build(BuildContext context) {
    final inputDecoration = Theme.of(context).inputDecorationTheme;
    const directColorScheme = AppColorSchemes.subtitleTextColor;

    if (widget.isPin) {
      return const Pinput(
        onCompleted: kLogs,
      );
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: 14.w500.copyWith(color: directColorScheme),
        ),
        TextFormField(
          keyboardType: widget.keyboardType,
          autofillHints: widget.autoFillHints,
          decoration: InputDecoration(
            hintText: widget.hint,
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
