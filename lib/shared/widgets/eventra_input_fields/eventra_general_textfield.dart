import 'package:eventra/core/utils/custom_log_file.dart';
import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/shared/theme/color_schemes.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class EventraGeneralTextfield extends StatefulWidget {
  const EventraGeneralTextfield({
    required this.hint,
    required this.label,
    required this.keyboardType,
    this.autoFillHints,
    this.onChanged,
    this.isPin = false,
    this.obscureText = false,
    this.suffixIcon,
    this.initialValue,
    this.maxLines = 1,
    this.minLines,
    this.readOnly = false,
    this.onTap,
    this.isRequired = false,
    super.key,
  });

  const EventraGeneralTextfield.pinPut({
    required this.hint,
    required this.label,
    required this.keyboardType,
    this.autoFillHints,
    this.onChanged,
    this.isPin = true,
    this.obscureText = false,
    this.suffixIcon,
    this.initialValue,
    this.maxLines = 1,
    this.minLines,
    this.readOnly = false,
    this.onTap,
    this.isRequired = false,
    super.key,
  });

  final String hint;
  final String label;
  final Iterable<String>? autoFillHints;
  final TextInputType keyboardType;
  final ValueChanged<String>? onChanged;
  final bool isPin;
  final bool obscureText;
  final Widget? suffixIcon;
  final String? initialValue;
  final int maxLines;
  final int? minLines;
  final bool readOnly;
  final VoidCallback? onTap;
  final bool isRequired;

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
      return Pinput(
        onCompleted: (val) {
          kLogs(val);
          widget.onChanged?.call(val);
        },
      );
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(widget.label, style: 14.w400),
            if (widget.isRequired)
              Text(
                ' *',
                style: 14.w500.copyWith(
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
          ],
        ),
        TextFormField(
          initialValue: widget.initialValue,
          obscureText: widget.obscureText,
          readOnly: widget.readOnly,
          onTap: widget.onTap,
          keyboardType: widget.keyboardType,
          maxLines: widget.maxLines,
          minLines: widget.minLines,
          autofillHints: widget.autoFillHints,
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle: inputDecoration.hintStyle,
            border: inputDecoration.border,
            enabledBorder: inputDecoration.enabledBorder,
            focusedBorder: inputDecoration.focusedBorder,
            errorBorder: inputDecoration.errorBorder,
            disabledBorder: inputDecoration.disabledBorder,
            contentPadding: inputDecoration.contentPadding,
            suffixIcon: widget.suffixIcon,
          ),
        ),
      ],
    );
  }
}
