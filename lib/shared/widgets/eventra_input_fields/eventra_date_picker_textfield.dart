//
// ignore_for_file: unnecessary_raw_strings

import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/shared/theme/color_schemes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EventraDatePickerTextfield extends StatefulWidget {
  const EventraDatePickerTextfield({
    required this.label,
    required this.hint,
    this.onChanged,
    super.key,
  });

  final String label;
  final String hint;
  final ValueChanged<String>? onChanged;

  @override
  State<EventraDatePickerTextfield> createState() =>
      _EventraDatePickerTextfieldState();
}

class _EventraDatePickerTextfieldState
    extends State<EventraDatePickerTextfield> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
          widget.label,
          style: 14.w500.copyWith(color: directColorScheme),
        ),
        TextFormField(
          controller: _controller,
          keyboardType: TextInputType.number,
          autofillHints: const [AutofillHints.birthday],
          inputFormatters: [
            _DateInputFormatter(),
          ],
          onChanged: (value) {
            if (value.length == 10) {
              // DD/MM/YYYY
              widget.onChanged?.call(value);
            }
          },
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

class _DateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // If the user is deleting, just return the newValue
    if (newValue.text.length < oldValue.text.length) {
      return newValue;
    }

    final text = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    // Day validation (DD)
    // ignore: prefer_is_empty
    if (text.length >= 1) {
      final dayFirstDigit = int.parse(text[0]);
      if (dayFirstDigit > 3) return oldValue;

      if (text.length >= 2) {
        final day = int.parse(text.substring(0, 2));
        if (day > 31 || day == 0) return oldValue;
      }
    }

    // Month validation (MM)
    if (text.length >= 3) {
      final monthFirstDigit = int.parse(text[2]);
      if (monthFirstDigit > 1) return oldValue;

      if (text.length >= 4) {
        final month = int.parse(text.substring(2, 4));
        if (month > 12 || month == 0) return oldValue;

        final day = int.parse(text.substring(0, 2));
        // Days in month check
        if (month == 2 && day > 29) return oldValue;
        if ([4, 6, 9, 11].contains(month) && day > 30) return oldValue;
      }
    }

    // Year validation (YYYY) - Leap year check for Feb 29
    if (text.length == 8) {
      final year = int.parse(text.substring(4, 8));
      final month = int.parse(text.substring(2, 4));
      final day = int.parse(text.substring(0, 2));

      if (month == 2 && day == 29) {
        final isLeapYear =
            (year % 4 == 0) && (year % 100 != 0 || year % 400 == 0);
        if (!isLeapYear) return oldValue;
      }
    }

    final buffer = StringBuffer();
    for (var i = 0; i < text.length; i++) {
      if (i > 7) break; // Limit to 8 digits
      buffer.write(text[i]);
      if ((i == 1 || i == 3) && i != text.length - 1) {
        buffer.write('/');
      }
    }

    final string = buffer.toString();
    return TextEditingValue(
      text: string,
      selection: TextSelection.collapsed(offset: string.length),
    );
  }
}
